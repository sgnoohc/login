#!/bin/env python

import sys
import ROOT
ROOT.gROOT.Macro('$ROOTCOREDIR/scripts/load_packages.C')        #https://twiki.cern.ch/twiki/bin/view/AtlasComputing/SoftwareTutorialxAODEDM#PyROOT_with_the_xAOD
xAODenabled = False
if(not ROOT.xAOD.Init().isSuccess()): print "Failed xAOD.Init()"  #https://twiki.cern.ch/twiki/bin/view/AtlasComputing/SoftwareTutorialxAODEDM#PyROOT_with_the_xAOD
else: xAODenabled = True
from array import array

# errors
ERROR_IN_CREATE_BRANCH = 1
ERROR_IN_CREATE_ARRAY = 2

###############################################################################################
#
#
# Class
#
#
###############################################################################################

#______________________________________________________________________________________________
#
# RooPyTree is a wrapper to handle ttree operation that I often use.
#
# self.ttree = TTree
# self.branches = dict of branches that the branches are associated with
#
class RooPyTree:
    #__________________________________________________________________________________________
    # constructor
    def __init__(self, ttree):
        self.ttree = ttree
        self.branches = dict()
        self.p4defs = dict()
        self.p4vecdefs = dict()
        #self.build_branches()
    ###########################################################################################
    # public
    ###########################################################################################
    #-----------
    # WRITING
    #-----------
    #__________________________________________________________________________________________
    # create_branch_from_a_list_of_brbookopts_in_a_file
    def create_branches_from_a_list_in_a_file(self, brbookoptfilepath):
        brbookoptfile = file(brbookoptfilepath)
        self.create_branches_from_list(brbookoptfile.readlines())
    #__________________________________________________________________________________________
    # set branch value
    def set_val(self, brname, val): self.branches[brname][0] = val
    #-----------
    # READING
    #-----------
    #__________________________________________________________________________________________
    # define string for reading 4 vector
    def define_p4_ptetaphim(self, pname, brptname, bretaname, brphiname, brmassname=""):
        self.p4defs[pname] = ["ptetaphim", brptname, bretaname, brphiname, brmassname]
    #__________________________________________________________________________________________
    # define string for reading 4 vector
    def define_p4_pxpypze(self, pname, brpxname, brpyname, brpzname, brename=""):
        self.p4defs[pname] = ["pxpypze", brpxname, brpyname, brpzname, brename]
    #__________________________________________________________________________________________
    # get the defined 4vector
    def p4(self, pname):
        tlv = ROOT.TLorentzVector()
        settype  = self.p4defs[pname][0]
        brp0name = self.p4defs[pname][1]
        brp1name = self.p4defs[pname][2]
        brp2name = self.p4defs[pname][3]
        brp3name = self.p4defs[pname][4]
        if settype == "ptetaphim":
            if brp3name == "": tlv.SetPtEtaPhiM(getattr(self.ttree, brp0name), getattr(self.ttree, brp1name), getattr(self.ttree, brp2name), 0)
            else             : tlv.SetPtEtaPhiM(getattr(self.ttree, brp0name), getattr(self.ttree, brp1name), getattr(self.ttree, brp2name), getattr(self.ttree, brp3name))
        elif settype == "pxpypze":
            tlv.SetPxPyPzE(getattr(self.ttree, brp0name), getattr(self.ttree, brp1name), getattr(self.ttree, brp2name), getattr(self.ttree, brp3name))
        return tlv
    #__________________________________________________________________________________________
    # define string for reading 4 vector
    def define_p4vec_ptetaphim(self, pname, brptname, bretaname, brphiname, brmassname=""):
        self.p4vecdefs[pname] = ["ptetaphim", brptname, bretaname, brphiname, brmassname]
    #__________________________________________________________________________________________
    # define string for reading 4 vector
    def define_p4vec_pxpypze(self, pname, brpxname, brpyname, brpzname, brename=""):
        self.p4vecdefs[pname] = ["pxpypze", brpxname, brpyname, brpzname, brename]
    #__________________________________________________________________________________________
    # get the defined 4vector
    def p4vec(self, pname):
        settype  = self.p4vecdefs[pname][0]
        brp0name = self.p4vecdefs[pname][1]
        brp1name = self.p4vecdefs[pname][2]
        brp2name = self.p4vecdefs[pname][3]
        brp3name = self.p4vecdefs[pname][4]
        brp0vec = getattr(self.ttree, brp0name)
        brp1vec = getattr(self.ttree, brp1name)
        brp2vec = getattr(self.ttree, brp2name)
        brpvec = zip(brp0vec, brp1vec, brp2vec)
        brp3vec = 0;
        if brp3name != "":
            brp3vec = getattr(self.ttree, brp3name)
            brpvec = zip(brp0vec, brp1vec, brp2vec, brp3vec)
        tlvs = []
        for brp in brpvec:
            tlv = ROOT.TLorentzVector()
            if settype == "ptetaphim":
                if brp3name == "": tlv.SetPtEtaPhiM(brp[0], brp[1], brp[2], 0)
                else             : tlv.SetPtEtaPhiM(brp[0], brp[1], brp[2], brp[3])
            elif settype == "pxpypze":
                tlv.SetPxPyPzE(brp[0], brp[1], brp[2], brp[3])
            tlvs.append(tlv)
        return tlvs
    ###########################################################################################
    # private
    ###########################################################################################
    #__________________________________________________________________________________________
    # build_self_branches
    #def build_branches(self):
    #    for i in self.ttree.GetListOfBranches():
    #        brbookopt = i.GetTitle()
    #        brname, multiplicity, brtype = self.parse_brbookopt(brbookopt)
    #        self.branches[brname] = self.create_array(brbookopt)
    #        self.ttree.SetBranchAddress(i.GetName(), self.branches[brname])
    #__________________________________________________________________________________________
    # create_branch_from_a_list_of_brbookopts
    def create_branches_from_list(self, brbookopts):
        for brbookopt in brbookopts:
            brbookopt = brbookopt.strip()
            if brbookopt[0] == "#":
                continue
            self.create_branch(brbookopt)
    #__________________________________________________________________________________________
    # create_branch
    def create_branch(self, brbookopt):
        self.create_array(brbookopt)
        self.create_tbranch(brbookopt)
    #__________________________________________________________________________________________
    # create actual tbranch
    def create_tbranch(self, brbookopt):
        brname, multiplicity, brtype = self.parse_brbookopt(brbookopt)
        self.ttree.Branch(brname, self.branches[brname], brname + "/" + brtype)
    #__________________________________________________________________________________________
    # create array
    def create_array(self, brbookopt):
        brname, multiplicity, brtype = self.parse_brbookopt(brbookopt)
        if brtype == "F":
            self.branches[brname] = array('f' , multiplicity*[0.])
        else:
            print "ERROR - provided branch type is not recognized or supported yet :", brtype, brbookopt
            sys.exit(ERROR_IN_CREATE_ARRAY)
    #__________________________________________________________________________________________
    # check brbookopt consisitency
    def check_brbookopt(self, brbookopt):
        if brbookopt.find("/") == -1:
            print "ERROR - provided branch booking name format does not contain '/' :", brbookopt
            sys.exit(ERROR_IN_CREATE_BRANCH)
    #__________________________________________________________________________________________
    # parse brbookopt
    # parses the string of branches such as
    # name[X]/T
    def parse_brbookopt(self, brbookopt):
        self.check_brbookopt(brbookopt)
        brname = brbookopt.split("/")[0]
        brtype = brbookopt.split("/")[1]
        multiplicity = 1
        if brname.find("[") !=-1 and brname.find("]") != -1:
            brname = brname.rsplit("[")[0]
            multiplicity = brname.rsplit("[")[1].rsplit("]")[0]
        return brname, multiplicity, brtype


###############################################################################################
#
#
# Public functions
#
#
###############################################################################################

#______________________________________________________________________________________________
# Retrieve a TChain from a list of files in a text file
# name = TTree name in each file
# filename = "filelist.txt" where it contains a list of files to be read separated by each line
def get_roopytree(name, filename):
    tchain = ROOT.TChain(name)
    lines = open(filename).readlines()
    for line in lines:
        tchain.Add(line.strip())
    return RooPyTree(tchain)

#______________________________________________________________________________________________
# Retrieve roopy tree wrapping a transient tree from a xAOD based root file
# path = root file path
def get_roopytree_xaod(path):
    f = ROOT.TFile.Open(path)
    t = ROOT.xAOD.MakeTransientTree(f, "CollectionTree")
    return RooPyTree(t)

# eof

#!/bin/env python

import sys
import ROOT
from array import array

# errors
ERROR_IN_CREATE_BRANCH = 1

###############################################################################################
#
#
# Private functions
#
#
###############################################################################################

#==============================================================================================================================
#
#  IO
#
#==============================================================================================================================

def parse_brbookopt(brbookopt):
    brname = brbookopt.split("/")[0]
    brtype = brbookopt.split("/")[1]
    multiplicity = 1
    if brname.find("[") !=-1 and brname.find("]") != -1:
        brname = brname.rsplit("[")[0]
        multiplicity = brname.rsplit("[")[1].rsplit("]")[0]
    return brname, multiplicity, brtype

def split_ttree_by_n(tree, n):
    nentries = tree.GetEntries()
    nentries_per_file = nentries / n
    overflow = nentries % n
    beginentrynum = []
    for i in xrange(n):
        beginentrynum.append(i*nentries_per_file)
    splittrees = []
    print nentries_per_file, overflow, beginentrynum
    for i in xrange(n):
        if i != n-1:
            splittrees.append(tree.CopyTree("1", "", nentries_per_file, beginentrynum[i]))
        else:
            splittrees.append(tree.CopyTree("1", "", nentries_per_file+overflow, beginentrynum[i]))
    return splittrees

def splitsave_ttree_by_n(tree, n):
    tree.GetEntry(0)
    filename = tree.GetCurrentFile().GetName()
    nentries = tree.GetEntries()
    nentries_per_file = nentries / n
    overflow = nentries % n
    beginentrynum = []
    for i in xrange(n):
        beginentrynum.append(i*nentries_per_file)
    print nentries_per_file, overflow, beginentrynum
    for i in xrange(n):
        tfile = ROOT.TFile("%s.%d"%(filename,i), "RECREATE")
        if i != n-1:
            newtree = tree.CopyTree("1", "", nentries_per_file, beginentrynum[i])
        else:
            newtree = tree.CopyTree("1", "", nentries_per_file+overflow, beginentrynum[i])
        newtree.Write()
        tfile.Close()

#==============================================================================================================================
#
#  Reading TLVs from pts, etas, phis, ... from TTree and sorting/filtering them based on number of TLVs or Pts
#
#==============================================================================================================================

# Sorting
def sort_tlvs(tlvs): return sorted(tlvs, key=lambda tlv: tlv.Pt(), reverse=True)

# Reading from TTree
def get_tlvs_PtEtaPhiM(pts, etas, phis, ms):
    tlvs = []
    for index in xrange(len(pts)):
        tlvs.append(ROOT.TLorentzVector())
        try:
            tlvs[-1].SetPtEtaPhiM(pts[index], etas[index], phis[index], ms[index])
        except:
            try:
                tlvs[-1].SetPtEtaPhiM(pts[index], etas[index], phis[index], 0)
            except:
                tlvs[-1].SetPtEtaPhiM(pts[index], 0, phis[index], 0)
    return tlvs

def get_tlvs_PtEtaPhiE(pts, etas, phis, Es):
    tlvs = []
    for index in xrange(len(pts)):
        tlvs.append(ROOT.TLorentzVector())
        try:
            tlvs[-1].SetPtEtaPhiE(pts[index], etas[index], phis[index], Es[index])
        except:
            tlvs[-1].SetPtEtaPhiE(pts[index], etas[index], phis[index], 0)
    return tlvs

def get_sorted_tlvs_PtEtaPhiE(pts, etas, phis, Es):
    return sort_tlvs(get_tlvs_PtEtaPhiE(pts, etas, phis, Es))

def get_sorted_tlvs_PtEtaPhiM(pts, etas, phis, ms):
    return sort_tlvs(get_tlvs_PtEtaPhiM(pts, etas, phis, ms))

# Modify list of TLVs
def filter_tlvs_by_pt(tlvs, minpt, maxpt=None):
    newtlvs = []
    for tlv in tlvs:
        if tlv.Pt() > minpt:
            if maxpt:
                if tlv.Pt() <= maxpt:
                    newtlvs.append(tlv)
            else:
                newtlvs.append(tlv)
    return newtlvs

def filter_tlvs_by_n(tlvs, n):
    newtlvs = []
    for index, tlv in enumerate(tlvs):
        if index < n:
            newtlvs.append(tlv)
    return newtlvs

# DeltaR matching
def match_tlvs(probes, tlvs, dR=0.4):
    for tlv in tlvs:
        if tlv.DeltaR(probetlv) < dR:
            return tlv

#==============================================================================================================================
#
#   Calculating INVM, DPHI, ... from list of TLVs
#
#==============================================================================================================================

def max_diM(itlvs, jtlvs):
    found = False
    invm = -999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if invm <= (itlv + jtlv).M():
                invm = (itlv + jtlv).M()
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return invm, found_itlv, found_jtlv
    else:
        return -999, None, None

def min_diM(itlvs, jtlvs):
    found = False
    invm = 999999999999999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if invm > (itlv + jtlv).M():
                invm = (itlv + jtlv).M()
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return invm, found_itlv, found_jtlv
    else:
        return -999, None, None

def min_DPhi(itlvs, jtlvs):
    found = False
    dphi = 999999999999999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if dphi > abs(itlv.DeltaPhi(jtlv)):
                dphi = abs(itlv.DeltaPhi(jtlv))
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return dphi, found_itlv, found_jtlv
    else:
        return -999, None, None

def max_DPhi(itlvs, jtlvs):
    found = False
    dphi = -999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if dphi <= abs(itlv.DeltaPhi(jtlv)):
                dphi = abs(itlv.DeltaPhi(jtlv))
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return dphi, found_itlv, found_jtlv
    else:
        return -999, None, None

def min_DEta(itlvs, jtlvs):
    found = False
    deta = 999999999999999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if deta > abs(itlv.Eta() - jtlv.Eta()):
                deta = abs(itlv.Eta() - jtlv.Eta())
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return deta, found_itlv, found_jtlv
    else:
        return -999, None, None

def max_DEta(itlvs, jtlvs):
    found = False
    deta = -999
    found_itlv = 0
    found_jtlv = 0
    for ii in xrange(len(itlvs)):
        for jj in xrange(len(jtlvs)):
            itlv = itlvs[ii]
            jtlv = jtlvs[jj]
            if itlv == jtlv:
                continue
            if deta <= abs(itlv.Eta() - jtlv.Eta()):
                deta = abs(itlv.Eta() - jtlv.Eta())
                found_itlv = itlv
                found_jtlv = jtlv
                found = True
    if found:
        return deta, found_itlv, found_jtlv
    else:
        return -999, None, None
###############################################################################################
#
#
# Class
#
#
###############################################################################################

#______________________________________________________________________________________________
#
# TTreeHandler is a wrapper to handle ttree operation that I often use.
#
#
class TTreeHandler:
    #__________________________________________________________________________________________
    # constructor
    def __init__( self, ttree ):
        self.ttree = ttree
    #__________________________________________________________________________________________
    # create_branch
    def create_branch( self, brbookopt ):
        if brbookopt.find("/") == -1:
            print "ERROR - provided branch booking name format does not contain '/' :", brbookopt
            sys.exit(ERROR_IN_CREATE_BRANCH)
        brname, multiplicity, brtype = parse_brbookopt(brbookopt)
        if brtype == "F":
            variable = array('f' , multiplicity*[0.])
        else:
            print "ERROR - provided branch type is not recognized or supported yet :", brtype, brbookopt
            sys.exit(ERROR_IN_CREATE_BRANCH)
        if multiplicity == 1:
            tree.Branch(brname , variable , brname + "/" + brtype)
        else:
            tree.Branch(brname , variable , brname + "[" + multiplicity + "]/" + brtype)
        return variable
    #__________________________________________________________________________________________
    # create_branch
    def create_branches_from_list( self, tree, brbookopts ):
        branches = dict()
        for brbookopt in brbookopts:
            brbookopt = brbookopt.strip()
            if brbookopt[0] == "#":
                continue
            brname, multiplicity, brtype = parse_brbookopt(brbookopt)
            branches[brname] = create_branch(brbookopt)
        return branches

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
def get_tchain(name, filename):
    tchain = ROOT.TChain(name)
    lines = open(filename).readlines()
    for line in lines:
        tchain.Add(line.strip())
    return tchain

#______________________________________________________________________________________________
# tree = output TTree that you wish to write to
# brbookopts = list of strings that has booking options
# format of each booking option is "variablename1/F"
def create_branches_from_list(tree, brbookopts):
    branches = dict()
    for brbookopt in brbookopts:
        brbookopt = brbookopt.strip()
        if brbookopt[0] == "#":
            continue
        brname, multiplicity, brtype = parse_brbookopt(brbookopt)
        branches[brname] = create_branch(tree, brbookopt)
    return branches

# eof

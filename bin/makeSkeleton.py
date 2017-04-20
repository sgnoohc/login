#!/bin/env python

# skeleton tree and class creator from text file

import os
import sys

# help function
def usage():
      print 'python', sys.argv[0], ' BRANCHLISTFILE CLASSNAME'
      sys.exit(-1)


# parse arguments
try:
    branch_list_file = sys.argv[1]
    branch_list = open(branch_list_file).readlines()
    classname = sys.argv[2]
except:
    usage()


# setup ROOT
try:
    import ROOT
except:
    print 'ROOT is not found. Setup ROOT before proceeding'
    sys.exit(-1)
ROOT.gROOT.SetBatch(True)


# output file
ofile = ROOT.TFile(classname + '.root', 'recreate')
otree = ROOT.TTree(classname, classname)

#ROOT.gROOT.LoadMacro('load_stl.h+')

# ProcessLine textline
processline = "struct %s_branches {" % classname

# loop over branches and create
for branch in branch_list:

    # remove any white space
    branch = branch.strip()

    # check if the line is not null
    if len(branch) == 0:
        continue

    # skip comment line
    if branch.find('#') != -1:
        continue

    # if not a skipped line each line must contain /
    if branch.find('/') == -1:
        print 'WARNING - line without / character is found line:', branch
        continue

    # parse name and type
    name = branch.split('/')[0]
    type = branch.split('/')[1]

    if type.find('v') != -1:
        subtype = type.split('v')[1]
        if subtype == 'F':
            vec = ROOT.vector('float')()
            processline += "vector<float> %s;"%name
        elif subtype == 'D':
            vec = ROOT.vector('double')()
            processline += "vector<double> %s;"%name
        elif subtype == 'O':
            vec = ROOT.vector('bool')()
            processline += "vector<bool> %s;"%name
        else:
            print 'not yet supported type', type
            continue
        otree.Branch(name, vec)
    else:
        if type == 'F':
            processline += "Float_t %s;"%name
        elif subtype == 'D':
            processline += "Double_t %s;"%name
        elif subtype == 'O':
            processline += "Bool_t %s;"%name
        elif subtype == 'i':
            processline += "UInt_t %s;"%name
        elif subtype == 'I':
            processline += "Int_t %s;"%name
        otree.Branch(name, 0, branch)

processline += "}"

otree.Write()
ofile.Close()

ifile = ROOT.TFile(classname + '.root', 'open')
itree = ifile.Get(classname)
#itree.MakeClass(classname)

processlineoutputfile = open(classname + '_brprocessline.txt', 'w')
processlineoutputfile.write(processline)

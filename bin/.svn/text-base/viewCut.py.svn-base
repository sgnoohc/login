#!/bin/env python

import sys
import os
from optparse import OptionParser

# help function
def usage():
    print 'HELP - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('[-v,--verbose]')
    optionhelpmsg.append('-s,--samples=samples.root:samples')
    optionhelpmsg.append('-c,--cutname=CutChannels')
    optionhelpmsg.append('-p,--entrypath=info/cuts/WW/ee')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# samples file
parser.add_option('-s', '--samples', dest='samplespath',
                  help='--samples=samples.root:samples')

# process definition file
parser.add_option('-c', '--cutname', dest='cutname', help='cutname')

# process definition file
parser.add_option('-p', '--entrypath', dest='entrypath', help='starting point for recursive search')

# verbose
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output' )

# parse options
(options, args) = parser.parse_args()

# check minimum options
if not options.samplespath: usage()
if not options.cutname: usage()
if not options.entrypath: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'
gROOT.SetBatch(True)
gSystem.Load('$TQPATH/lib/libQFramework.so')
import tool

tqsf = TQSampleFolder.loadSampleFolder(options.samplespath)

cutfolderentryfolder = tqsf.getFolder(options.entrypath)
if not cutfolderentryfolder:
    print "ERROR - provided entry point does not exist!"
    print "        provided =",options.entrypath
    sys.exit(-1)

cutfolder = tool.get_folder_with_name(cutfolderentryfolder, options.cutname)
if not cutfolder:
    print "ERROR - requested folder name has not been found!"
    print "        requested =",options.cutname
    sys.exit(-1)

cutexpr = TString("")
wgtexpr = TString("")

tool.printObj(cutfolder, "r1")
cutfolder.getTagString(".cutExpression", cutexpr)
cutfolder.getTagString(".weightExpression", wgtexpr)

print cutexpr, "          ", wgtexpr

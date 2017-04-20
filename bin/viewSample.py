#!/bin/env python

import os
import sys
from optparse import OptionParser

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-s,--sample=file.root:samples_Nominal')
    optionhelpmsg.append('[-p,--printoption=rdt]')
    optionhelpmsg.append('[-r,--rootpath=/bkg/ee/blah]')
    #optionhelpmsg.append('-f,--file=sample.root')
    #optionhelpmsg.append('-m,--metadata=configs/metadata/sampletreelocation.txt')
    #optionhelpmsg.append('-O,--outdir=/path/to/outdir')
    #optionhelpmsg.append('-c,--cutdefs=cuts.txt,cr_cuts.txt')
    #optionhelpmsg.append('[-p,--cutparams=cutparams.txt,cr_cutparams.txt]')
    #optionhelpmsg.append('[-L,--lumi=20980.2]')
    #optionhelpmsg.append('[-H,--histdefs]')
    optionhelpmsg.append('[-v,--verbose]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# sample option
parser.add_option('-s', '--sample', dest='sample', help='full path to sample')

# root path of the tree user wants to examine
parser.add_option('-r', '--rootpath', dest='rootpath', help='bkg/ee/blah')

# print option
parser.add_option('-p', '--printoption', dest='printoption', help='rdt, rH, or etc.')

## metadata option
#parser.add_option('-m', '--metadata', dest='metadata',
#                  help='metadata file e.g. --metadata=metadata/sampletreelocation.txt')
#
## cut option
#parser.add_option('-c', '--cutdefs', dest='cutdefs',
#                  help='cut definition files e.g. --cutdefs=cuts.txt,cr_cuts.txt')
#
## cut param option
#parser.add_option('-p', '--cutparams', dest='cutparams',
#                  help='cut definition files e.g. --cutparams=cutparams.txt,cr_cutparams.txt')
#
## histogram option
#parser.add_option('-H', '--histdefs', dest='histdefs',
#                  help='histogram definition files e.g. --histdefs=histograms.txt,histograms1.txt')
#
## output directory name
#parser.add_option('-L', '--lumi', dest='lumi',
#                  help='final TQSampleFolder root file output dir')
#
## output directory name
#parser.add_option('-O', '--outdir', dest='outdir',
#                  help='final TQSampleFolder root file output dir')
#
## verbose option
#parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
#                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.sample: usage()
if not options.printoption: options.printoption = 'rdt'
#if not options.metadata: usage()
#if not options.lumi: options.lumi = '20980.2'
#if not options.outdir: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'

gROOT.SetBatch(True)
from QFramework import *
#gSystem.Load('$TQPATH/lib/libQFramework.so')

import tool

samples = TQSampleFolder.loadSampleFolder('%s'%(options.sample))
if options.rootpath:
    tool.printObj(samples, options.rootpath + ':' + options.printoption)
else:
    tool.printObj(samples, options.printoption)


#eof

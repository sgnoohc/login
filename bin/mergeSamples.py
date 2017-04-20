#!/bin/env python

import os
import sys
from optparse import OptionParser

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-o,--outputfilename=samples.root')
    optionhelpmsg.append('-s,--outputsamplename=samples_Nominal')
    #optionhelpmsg.append('-d,--sampledir=/path/to/dir/with/samples')
    #optionhelpmsg.append('-O,--outdir=/path/to/outdir')
    #optionhelpmsg.append('-m,--metadata=/path/to/samplemap.txt')
    optionhelpmsg.append('[-v,--verbose]')
    print '    %s %s FILE1:samplename FILE2:samplename ...'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# outfilename option
parser.add_option('-o', '--outputfilename', dest='outputfilename',
                  help='output sample file name')

# outsamplename option
parser.add_option('-s', '--outputsamplesname', dest='outputsamplename',
                  help='output sample name')

## metadata option
#parser.add_option('-d', '--sampledir', dest='sampledir',
#                  help='path to directory containing samples')
#
## metadata option
#parser.add_option('-m', '--metadata', dest='metadata',
#                  help='metadata file for samples to combine e.g. --metadata=metadata/samplemap.txt')
#
## output directory name
#parser.add_option('-O', '--outdir', dest='outdir',
#                  help='final TQSampleFolder root file output dir')

# verbose option
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.outputfilename: usage()
if not options.outputsamplename: usage()
#if not options.metadata: usage()
#if not options.outdir: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'

#gROOT.SetBatch(True)
#gSystem.Load('$TQPATH/lib/libQFramework.so')
from QFramework import *
#TQLibrary.gQFramework.setApplicationName(alias);

samples = TQSampleFolder.newSampleFolder('samples')

import tool

tqsamplefolders = []

for samplepath in args:
    tqsamplefolders.append(TQSampleFolder.loadSampleFolder("%s"%samplepath))

print tqsamplefolders

tool.printObj(tqsamplefolders[0], 'rd')
tool.printObj(tqsamplefolders[1], 'rd')

tqsamplefolders[0].merge(tqsamplefolders[1])

tool.printObj(tqsamplefolders[0], 'rd')

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
    optionhelpmsg.append('-c,--cutlist=CutChannels')
    optionhelpmsg.append('-p,--processdef=definitions/process.txt')
    optionhelpmsg.append('[-t,--cutflowtag]')
    optionhelpmsg.append('[-y,--style]')
    optionhelpmsg.append('[-O,--outdir=cutflows]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print 'COMMENT : Please remember that the processdef and cutlist has DIFFERENT syntax compared to old run 1 style'
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

# cut option
parser.add_option('-c', '--cutlist', dest='cutlist', help='list of cuts')

# process definition file
parser.add_option('-p', '--processdef', dest='processdef', help='process def file')

# configuration file
parser.add_option('-t', '--cutflowtag', dest='cutflowtag', help='cutflow tag file')

# samples style file
parser.add_option('-y', '--style', dest='style', help='style files')

# output directory name
parser.add_option('-O', '--outdir', dest='outdir',
                  help='final plot output dir')

# verbose
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output' )

# parse options
(options, args) = parser.parse_args()

# check minimum options
if not options.samplespath: usage()
if not options.cutlist: usage()
if not options.processdef: usage()
if not options.outdir: options.outdir = 'cutflows'

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'
gROOT.SetBatch(True)
gSystem.Load('$TQPATH/lib/libQFramework.so')
import tool

# open up sample files
samples = TQSampleFolder.loadSampleFolder(options.samplespath)

# apply style if option is provided.
if options.style:
    for style in options.style.split(','):
        if not os.path.exists(style):
            print 'ERROR - style file provided does not exist!'
            print '   you provided --style=...,'+style+',...'
            print '   please check the filepath'
            print ''
            sys.exit(-1)
        samples.importFromTextFile(style)

# declare data reader
rd = TQSampleDataReader(samples)

# export cutflowtag : TODO make it into a multiple tags
if options.cutflowtag:
    if not os.path.exists(options.cutflowtag):
        print 'ERROR - tag file provided does not exist!'
        print '   you provided --plottag=...,'+options.plottag+',...'
        print '   please check the filepath'
        print ''
        sys.exit(-1)
    cutflowtagreader = TQConfigReader('tags_cutflowprinter', options.cutflowtagreader)
    cutflowtags = cutflowtagreader.exportAsTags()

    # if verbose print plotag
    if options.verbose:
        cutflowtags.printTags()
        print ''
else:
    cutflowtags = TQTaggable()

# create outputdir
if not os.path.exists(options.outdir):
    os.makedirs(options.outdir)

# decalre cutflow printer
cutflowprinter = TQCutflowPrinter(samples)
cutflowprinter.resetProcesses()
cutflowprinter.importProcessesFromFile(options.processdef, "")
cutflowprinter.resetCuts()
cutflowprinter.importCutsFromFile(options.cutlist, "")
cutflow = cutflowprinter.createTable(cutflowtags)
processname = os.path.basename(options.processdef).split('.')[0]
cutname = os.path.basename(options.cutlist).split('.')[0]
outputdir = options.outdir
print cutflow.writeCSV  ('%s/%s-%s.csv' %(outputdir,processname,cutname),cutflowtags)
print cutflow.writeHTML ('%s/%s-%s.html'%(outputdir,processname,cutname),cutflowtags)
print cutflow.writeLaTeX('%s/%s-%s.tex' %(outputdir,processname,cutname),cutflowtags)

tool.saveCommand()

#eof

#!/bin/env python

import sys
import os
from optparse import OptionParser

# help function
def usage():
    print 'HELP - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('[-l,--list]')
    optionhelpmsg.append('[-v,--verbose]')
    optionhelpmsg.append('-x,--var=Mjj')
    optionhelpmsg.append('-c,--cut=CutChannels')
    optionhelpmsg.append('-s,--samples=samples.root:samples')
    optionhelpmsg.append('-p,--processdef=definitions/process.txt')
    optionhelpmsg.append('-e,--examplepath=bkg/ee/something')
    optionhelpmsg.append('[-E,--extensions=pdf]')
    optionhelpmsg.append('[-t,--plottag]')
    optionhelpmsg.append('[-y,--style]')
    optionhelpmsg.append('[-O,--outdir=plots]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# cut option
parser.add_option('-c', '--cut', dest='cut', help='cut name')

# variable to plot
parser.add_option('-x', '--var', dest='var', help='var name')

# samples file
parser.add_option('-s', '--samples', dest='samplespath',
                  help='--samples=samples.root:samples')

# process definition file
parser.add_option('-p', '--processdef', dest='processdef', help='process def file')

# configuration file
parser.add_option('-t', '--plottag', dest='plottag', help='plottertag file')

# samples style file
parser.add_option('-y', '--style', dest='style', help='style files')

# when instead want to print all possible cuts and plots to draw
parser.add_option('-l', '--list', dest='dolist', action='store_true', default=False,
                  help='list of possible cuts and variables' )

# output directory name
parser.add_option('-O', '--outdir', dest='outdir',
                  help='final plot output dir')

# examplepath
parser.add_option('-e', '--examplepath', dest='examplepath',
                  help='an example path where the cutlist can be created from')

# output extensions
parser.add_option('-E', '--extensions', dest='extensions',
                  help='final plot output file extensions')

# verbose
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output' )

# parse options
(options, args) = parser.parse_args()

# check minimum options
if not options.cut and not options.dolist: usage()
if not options.var and not options.dolist: usage()
if not options.samplespath: usage()
if not options.processdef: usage()
if not options.outdir: options.outdir = 'plots'
if not options.extensions: options.extensions = 'pdf'
if not options.examplepath: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'
gROOT.SetBatch(True)
gSystem.Load('$TQPATH/lib/libQFramework.so')
import tool

# open up sample files
samples = TQSampleFolder.loadSampleFolder(options.samplespath)
if options.verbose:
    print 'Opened sample', samples

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

# export plottag : TODO make it into a multiple tags
if options.plottag:
    if not os.path.exists(options.plottag):
        print 'ERROR - tag file provided does not exist!'
        print '   you provided --plottag=...,'+options.plottag+',...'
        print '   please check the filepath'
        print ''
        sys.exit(-1)
    plottagreader = TQConfigReader('tags_plotter', options.plottag)
    tags_plotter = plottagreader.exportAsTags()

    # if verbose print plotag
    if options.verbose:
        tags_plotter.printTags()
        print ''
else:
    tags_plotter = TQTaggable()

# decalre plotter
plotter = TQHWWPlotter(samples)

# import process
plotter.resetProcesses()
# TODO extend to support multiple file option
if not os.path.exists(options.processdef):
    print 'ERROR - processdef file provided does not exist!'
    print '   you provided --processdef=...,'+options.processdef+',...'
    print '   please check the filepath'
    print ''
    sys.exit(-1)
processes = tool.readMetaDataFile(options.processdef)
naddedprocess = 0
for process in processes:
    if options.verbose:
        print 'adding', process['Type'], 'process', process['SamplePath']
    try:
        if process['Scale']:
            exec "plotscalefactor = str(float("+process['Scale']+"))"
        else:
            plotscalefactor = 1
        exec "plotter.add" + process['Type'] + "(\'" + process['SamplePath'] + "\', \' scale = " + plotscalefactor + "\')"
    except:
        exec "plotter.add" + process['Type'] + "(\'" + process['SamplePath'] + "\')"
    naddedprocess += 1

# check that there was process imported
if naddedprocess == 0:
    print 'added process are not more than 0'
    usage()

if options.verbose:
    tool.printObj(samples, 'rH')

# gather cut names
#examplepath = tool.get_example_path(processes[0]['SamplePath'])
print options.examplepath
cutlist = samples.getListOfFolders(options.examplepath + '/.histograms/?')

cuts = []
for cut in cutlist:
    cuts.append(cut.GetName())
cutlist = cuts

# gather var names
xvars = []
for var in samples.getListOfHistogramNames(): xvars.append(str(var).split('/')[1])
varlist = list(set(xvars))
varlist.sort()

if options.dolist:
    print 'PRINTLIST - you provided option -l or --list. Printing available objects'
    print ''
    print 'List of possible XVAR -x option'
    for var in varlist:
        print ' + ',var
    print ''
    print 'List of possible Cuts -c option'
    for cut in cutlist:
        print ' + ',cut
    print ''
    usage()

for var in options.var.split(','):
    if var not in varlist:
        print 'requested variable is not in the list of histograms! requested:', var
        sys.exit(-1)
for cut in options.cut.split(','):
    if cut not in cutlist:
        print 'requested cut is not in the list of cuts! requested:', cut
        sys.exit(-1)

# create outputdir
if not os.path.exists(options.outdir):
    os.makedirs(options.outdir)

print 'running makePlot.py ...'
print ''
print 'Creating plots'
for var in options.var.split(','):
    for cut in options.cut.split(','):
        plotname = '%s/%s'%(cut, var)
        for extension in options.extensions.split(','):
            plotfilename = '%s/%s_%s.%s'%(options.outdir, cut, var, extension)
            plotter.plotAndSaveAs(plotname, plotfilename, tags_plotter)
print ''

tool.saveCommand()

#eof

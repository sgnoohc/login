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
    optionhelpmsg.append('-D,--drawoptions=lego')
    optionhelpmsg.append('[-f,--force]')
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

# draw options
parser.add_option('-D', '--drawoptions', dest='drawoptions', help='drawoptions')

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

# verbose
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output' )

# verbose
parser.add_option('-f', '--force', dest='force', action='store_true', default=False,
                  help='print verbose output' )

# parse options
(options, args) = parser.parse_args()

# check minimum options
if not options.cut and not options.dolist: usage()
if not options.var and not options.dolist: usage()
if not options.samplespath: usage()
if not options.processdef: usage()
if not options.drawoptions: usage()
if not options.outdir: options.outdir = 'plots'

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

# import process
# TODO extend to support multiple file option
if not os.path.exists(options.processdef):
    print 'ERROR - processdef file provided does not exist!'
    print '   you provided --processdef=...,'+options.processdef+',...'
    print '   please check the filepath'
    print ''
    sys.exit(-1)
processes = tool.readMetaDataFile(options.processdef)

# gather cut names
cutlist = samples.getListOfFolders(processes[0]['SamplePath'] + '/.histograms/?')

cuts = []
if cutlist:
    for cut in cutlist:
        cuts.append(cut.GetName())
    cutlist = cuts
elif options.force:
    pass
else:
    print 'No cut list was able to be found from a first path in the plotprocess'
    

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

if not options.force:
    for var in options.var.split(','):
        if var not in varlist:
            print 'requested variable is not in the list of histograms! requested:', var
            sys.exit(-1)
    for cut in options.cut.split(','):
        if cut not in cutlist:
            print 'requested cut is not in the list of cuts! requested:', cutden
            sys.exit(-1)

# create outputdir
if not os.path.exists(options.outdir):
    os.makedirs(options.outdir)

print 'python'

# save palette
tool.set_palette()

gStyle.SetPaintTextFormat(".1f")

print 'running makePlot2D.py ...'
print ''
print 'Creating plots'
# loop process and plot each plot
for process in processes:
    for cut in options.cut.split(','):
        for var in options.var.split(','):
            c1 = TCanvas()
            try:
                h2 = rd.getHistogram(process['SamplePath'], '%s/%s'%(cut, var), process["Option"])
            except:
                h2 = rd.getHistogram(process['SamplePath'], '%s/%s'%(cut, var))
            print 'here', h2
            for drawoption in options.drawoptions.split(','):
                h2.Draw(drawoption)
                plotfilename = '%s/%s_%s_%s_%s.pdf'%(options.outdir, cut, var, process['SampleName'], drawoption)
                c1.SaveAs(plotfilename)
print ''

tool.saveCommand()

#eof

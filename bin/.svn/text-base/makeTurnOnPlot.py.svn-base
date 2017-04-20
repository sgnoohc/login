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
    optionhelpmsg.append('-D,--cutden=Cut_denominator')
    optionhelpmsg.append('-N,--cutnum=Cut_numerator')
    optionhelpmsg.append('-s,--samples=samples.root:samples')
    optionhelpmsg.append('-p,--processdef=definitions/process.txt')
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

# cut den option
parser.add_option('-D', '--cutden', dest='cutden', help='denominator cut name')

# cut option
parser.add_option('-N', '--cutnum', dest='cutnum', help='numerator cut name')

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

# verbose
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output' )

# parse options
(options, args) = parser.parse_args()

# check minimum options
if not options.cutden and not options.dolist: usage()
if not options.cutnum and not options.dolist: usage()
if not options.var and not options.dolist: usage()
if not options.samplespath: usage()
if not options.processdef: usage()
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
for cutden in options.cutden.split(','):
    if cutden not in cutlist:
        print 'requested cut is not in the list of cuts! requested:', cutden
        sys.exit(-1)
for cutnum in options.cutnum.split(','):
    if cutnum not in cutlist:
        print 'requested cut is not in the list of cuts! requested:', cutnum
        sys.exit(-1)

# create outputdir
if not os.path.exists(options.outdir):
    os.makedirs(options.outdir)

print 'running makeTurnOnPlot.py ...'
print ''
print 'Creating eff plots'
# loop process and plot each plot
for process in processes:
    for cutnum in options.cutnum.split(','):
        for cutden in options.cutden.split(','):
            for var in options.var.split(','):
                c1 = TCanvas()
                numhist = rd.getHistogram(process['SamplePath'], '%s/%s'%(cutnum, var), 'rebin = 20')
                denhist = rd.getHistogram(process['SamplePath'], '%s/%s'%(cutden, var), 'rebin = 20')
                #numhist.Print('all')
                #denhist.Print('all')
                numhist.SetLineColor(kRed)
                denhist.SetLineColor(kBlue)
                turnon = TGraphAsymmErrors()
                turnon.Divide(numhist, denhist)
                turnon.SetMaximum(1.1)
                turnon.SetMinimum(0)
                turnon.Draw('ap')
                scale = 1 / denhist.Integral()
                extrascale = 1.
                denhist.Scale(scale)
                extrascale = 0.8 / denhist.GetMaximum()
                denhist.Scale(extrascale)
                numhist.Scale(scale * extrascale)
                numhist.Draw('histsame')
                denhist.Draw('histsame')
                plotfilename = '%s/%s_%s_%s_%s.pdf'%(options.outdir, cutnum, cutden, var, process['SampleName'])
                c1.SaveAs(plotfilename)
print ''

tool.saveCommand()

#eof

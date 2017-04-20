#!/bin/env python

import os
import sys
from optparse import OptionParser

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-s,--samplesname=samples')
    optionhelpmsg.append('-d,--sampledir=/path/to/dir/with/samples')
    optionhelpmsg.append('-O,--outdir=/path/to/outdir')
    optionhelpmsg.append('-m,--metadata=/path/to/samplemap.txt')
    optionhelpmsg.append('-M,--merge')
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
parser.add_option('-s', '--samplesname', dest='samplesname',
                  help='output sample name to run')

# metadata option
parser.add_option('-d', '--sampledir', dest='sampledir',
                  help='path to directory containing samples')

# metadata option
parser.add_option('-m', '--metadata', dest='metadata',
                  help='metadata file for samples to combine e.g. --metadata=metadata/samplemap.txt')

# output directory name
parser.add_option('-O', '--outdir', dest='outdir',
                  help='final TQSampleFolder root file output dir')

# verbose option
parser.add_option('-M', '--merge', dest='merge', action='store_true', default=False,
                  help='merge samples that are being added')

# verbose option
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.samplesname: usage()
if not options.sampledir: usage()
if not options.metadata: usage()
if not options.outdir: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'

gROOT.SetBatch(True)
#gSystem.Load('$TQPATH/lib/libQFramework.so')
from QFramework import *

samples = TQSampleFolder.newSampleFolder('samples_Nominal')

import tool

# set metadata
metadata = []
for singlemetadata in options.metadata.split(','):
    if not os.path.exists(singlemetadata):
        print 'ERROR - metadata file provided does not exist!'
        print '   you provided --metadata = ... , ', singlemetadata, ', ...'
        print '   please check the filepath'
        print ''
        sys.exit(-1)
    metadata += tool.readMetaDataFile(singlemetadata)

# check sample path exists
if not os.path.exists(options.sampledir):
    print 'ERROR - sample dir path does not exist!'
    print '   you provided --sampledir =', options.sampledir
    print '   please check the filepath'
    print ''
    sys.exit(-1)

# load and add samples
for item in metadata:
    sourcesamplefilename = item['SourceSampleFileName']
    sourcesamplename = item['SourceSampleName']
    sourcesamplepath = item['SourceSamplePath']
    targetsamplepath = item['TargetSamplePath']

    #print samplename

    samplefilename = os.path.join(options.sampledir, sourcesamplefilename)

    sample = samples.getSampleFolder(targetsamplepath + '+')
    sourcesamples = TQSampleFolder.loadSampleFolder("%s:%s"%(samplefilename, sourcesamplename))
    sourcesample = sourcesamples.getSample(sourcesamplepath)
    sourcesample.printContents("rH")
    sample.addCopyOfObject(sourcesample)
    #cmd = "%s:%s >>::%s"%(samplefilename, sourcesamplepath, item["TargetSampleName"])
    #print cmd
    #if not sample.importObject(cmd):
    #    print "WARNING - importing the sample:", samplefilename, "failed"

    #if not options.merge:
    #    sample = samples.getSampleFolder(targetsamplepath + '+')
    #    #if not sample.importObject("%s:samples/%s >>::%s"%(samplefilename, samplename, item["NewSampleName"])):
    #    print "%s:samples_Nominal/%s >>::%s"%(samplefilename, samplename, item["NewSampleName"])
    #    if not sample.importObject("%s:samples_Nominal/%s >>::%s"%(samplefilename, samplename, item["NewSampleName"])):
    #    #if not sample.importObject("%s:samples_Nominal >>::%s"%(samplefilename, item["NewSampleName"])):
    #        print "WARNING - importing the sample:", samplename, "failed"
    #else:
    #    samplefolder = samples.getSampleFolder(samplepath)
    #    if not samplefolder:
    #        samplefolder = samples.getSampleFolder(samplepath + '+')
    #    targetsample = samplefolder.getSample(samplepath.split("/")[-1])
    #    if not targetsample:
    #        targetsample = TQSampleFolder.loadSampleFolder(samplefilename + ':samples/' + samplename)
    #        targetsample.SetName(samplepath.split("/")[-1])
    #        samplefolder.addSampleFolder(targetsample)
    #    else:
    #        objectsample = TQSampleFolder.loadSampleFolder(samplefilename + ':samples/' + samplename)
    #        targetsample.merge(objectsample)

#tool.printObj(samples, 'rdtH')
tool.printObj(samples, 'rH')

# write sample
if not os.path.exists(options.outdir):
    os.makedirs(options.outdir)
outfn = os.path.join(options.outdir, options.samplesname + '.root')
print ''
print 'writing analysis file \'%s\''%outfn
print ''
#outfile = TFile.Open(outfn, 'RECREATE')
#samples.writeFolder('samples', TObject.kOverwrite)
#samples.writeToFile(outfn, True, 20)
samples.writeToFile(outfn, True, 20)

tool.saveCommand()

#eof

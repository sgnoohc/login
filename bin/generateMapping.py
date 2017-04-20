#!/bin/env python

import os
import sys
from optparse import OptionParser

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-s,--samples=samples_Nominal')
    optionhelpmsg.append('-f,--file=sample.root')
    optionhelpmsg.append('-r,--rootpath=bkg/ee')
    optionhelpmsg.append('-o,--output=map.txt')
    optionhelpmsg.append('-d,--maxdepth=int')
    optionhelpmsg.append('-a,--attachroot')
    #optionhelpmsg.append('-m,--metadata=configs/metadata/sampletreelocation.txt')
    #optionhelpmsg.append('-O,--outdir=/path/to/outdir')
    #optionhelpmsg.append('-c,--cutdefs=cuts.txt,cr_cuts.txt')
    #optionhelpmsg.append('[-p,--cutparams=cutparams.txt,cr_cutparams.txt]')
    #optionhelpmsg.append('[-L,--lumi=20980.2]')
    #optionhelpmsg.append('[-H,--histdefs]')
    #optionhelpmsg.append('[-v,--verbose]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    sys.exit(-1)

# option parser
parser = OptionParser()

# sample option
parser.add_option('-s', '--samplename', dest='samplename', help='sample name')

# file option
parser.add_option('-f', '--file', dest='file', help='file to the TQSampleFolder')

# rootpath option
parser.add_option('-r', '--rootpath', dest='rootpath',
                  help='Path to the TQSampleFolder where it will build the mapping')

# output metadata option
parser.add_option('-o', '--output', dest='output', help='output metadata text file')

# depth metadata option
parser.add_option('-d', '--maxdepth', dest='maxdepth', help='depth setting')

# verbose option
parser.add_option('-a', '--attachroot', dest='attachroot', action='store_true', default=False,
                  help='attach root path to the SamplePath')

# verbose option
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.samplename: usage()
if not options.file: usage()
if not options.rootpath: usage()
if not options.output: usage()
if not options.maxdepth: options.maxdepth = 999
#if not options.metadata: usage()
#if not options.lumi: options.lumi = '20980.2'
#if not options.outdir: usage()

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'

gROOT.SetBatch(True)
gSystem.Load('$TQPATH/lib/libQFramework.so')

import tool

samplefolder = TQSampleFolder.loadSampleFolder(options.file + ":" + options.samplename)

#tool.printObj(samplefolder, options.rootpath + ":")

rootfolder = samplefolder.getSampleFolder(options.rootpath)

metadata = list()

def recursive_path_print(folder, aggregatepath, depth):
    if folder.getListOfSampleFolders("?") and depth < int(options.maxdepth):
        for subfolder in folder.getListOfSampleFolders("?"):
            newaggregatepath = aggregatepath + "/" + subfolder.GetName()
            newdepth = depth + 1
            recursive_path_print(subfolder, newaggregatepath, newdepth)
    else:
        samplename = aggregatepath.split("/")[-1]
        samplepath = aggregatepath.split("/")[:-1]
        metadatum = dict()
        metadatum["SampleName"] = samplename
        metadatum["NewSampleName"] = samplename
        if options.attachroot:
            metadatum["SamplePath"] = options.rootpath + "/".join(samplepath)
        else:
            metadatum["SamplePath"] = "/".join(samplepath)
        metadata.append(metadatum)

recursive_path_print(rootfolder, "", 0)

tool.writeMetaDataToFile(metadata, options.output, "%-18s : %-33s : %-20s", "%-20s %-35s %s");

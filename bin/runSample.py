#!/bin/env python

import os
import sys
from optparse import OptionParser

# help function
def usage():
    print 'ERROR - Usage:'
    print ''
    optionhelpmsg = []
    optionhelpmsg.append('-s,--sample=Zjets')
    optionhelpmsg.append('-m,--metadata=configs/metadata/sampletreelocation.txt')
    optionhelpmsg.append('-O,--outdir=/path/to/outdir')
    optionhelpmsg.append('-c,--cutdefs=cuts.txt,cr_cuts.txt')
    optionhelpmsg.append('[-a,--aliasdata=aliases.txt]')
    optionhelpmsg.append('[-t,--treejobbranch=branches.txt]')
    optionhelpmsg.append('[-r,--treejobcutname=CutWeights]')
    optionhelpmsg.append('[-p,--cutparams=cutparams.txt,cr_cutparams.txt]')
    optionhelpmsg.append('[-L,--lumi=20280.2]')
    optionhelpmsg.append('[-H,--histdefs]')
    optionhelpmsg.append('[-v,--verbose]')
    print '    %s %s'%(sys.argv[0],' '.join(optionhelpmsg))
    print ''
    print 'But you typed:'
    print '  >   %s'%(' '.join(sys.argv))
    print ''
    print ''
    print ''
    print ''
    print ''
    print ''
    print ''
    print '              =============='
    print '              === Manual ==='
    print '              =============='
    print ''
    print ''
    print ' + Metadata (option -m,--metadata)'
    print ''
    print '     metadata file has a format like the following :'
    print ''
    print '      ####################################################################################################################################################################################'
    print '      Format'
    print '      SampleName         : Normalization                     : TreeLocation'
    print '      ####################################################################################################################################################################################'
    print '      169471_em            0.000000786666603057583419015230    /scratch/atlas83/pcchang2/physics/hsg3/group.phys-higgs.hsg3.standard_ntuples.00-02-31/WW_1_mc12/Nominal/169471.root:HWWTree_em'
    print '      ..........'
    print '      ..........'
    print '      ..........'
    print '      ..........'
    print '      169471_me            0.000000786666603057583419015230    /scratch/atlas83/pcchang2/physics/hsg3/group.phys-higgs.hsg3.standard_ntuples.00-02-31/WW_1_mc12/Nominal/169471.root:HWWTree_em'
    print ''
    print ''
    print ''
    print ' + Cut definition file (option -c,--cutdefs)'
    print ''
    print '     cut definition file has a format like the following :'
    print ''
    print '      # low met cut'
    print '      # -----------------------------------------------'
    print '      CutMbbll_mh125_bTagGeq2: CutMll_ma30_bTagGeq2_wMbb << 120000 < Mbbll && Mbbll < 160000;'
    print ''
    print ''
    print ''

    sys.exit(-1)

# option parser
parser = OptionParser()

# sample option
parser.add_option('-s', '--sample', dest='sample',
                  help='sample name to run')

# metadata option
parser.add_option('-m', '--metadata', dest='metadata',
                  help='metadata file e.g. --metadata=metadata/sampletreelocation.txt')

# cut option
parser.add_option('-c', '--cutdefs', dest='cutdefs',
                  help='cut definition files e.g. --cutdefs=cuts.txt,cr_cuts.txt')

# cut param option
parser.add_option('-p', '--cutparams', dest='cutparams',
                  help='cut definition files e.g. --cutparams=cutparams.txt,cr_cutparams.txt')

# tree aliases names
parser.add_option('-a', '--aliasdata', dest='aliasdata',
                  help='list of alias datae.g. --aliasdata=alias1.txt,alias2.txt')

# tree job branches name
parser.add_option('-t', '--treejobbranch', dest='treejobbranch',
                  help='copy tree job branch list e.g. --treejobbranch=branchlist1.txt,branchlist2.txt')

# tree job cut name
parser.add_option('-r', '--treejobcutname', dest='treejobcutname',
                  help='copy tree job cut name e.g. --treejobcutname=CutWeights')

# histogram option
parser.add_option('-H', '--histdefs', dest='histdefs',
                  help='histogram definition files e.g. --histdefs=histograms.txt,histograms1.txt')

# output directory name
parser.add_option('-L', '--lumi', dest='lumi',
                  help='final TQSampleFolder root file output dir')

# output directory name
parser.add_option('-O', '--outdir', dest='outdir',
                  help='final TQSampleFolder root file output dir')

# verbose option
parser.add_option('-v', '--verbose', dest='verbose', action='store_true', default=False,
                  help='print verbose output')

# parse options
(options, args) = parser.parse_args()

# check if a sample is provided
if not options.sample: usage()
if not options.cutdefs: usage()
if not options.metadata: usage()
if not options.lumi: options.lumi = '20280.2'
if not options.outdir: usage()
if not options.treejobcutname: options.treejobcutname = 'CutWeights'

# import ROOT
try: from ROOT import *
except: print 'No ROOT module found, please setup ROOT before proceeding'

import tool

gROOT.SetBatch(True)
gSystem.Load('$TQPATH/lib/libQFramework.so')

# set cutfactory
cf = TQCutFactory()
for cutdef in options.cutdefs.split(','):
    if not os.path.exists(cutdef):
        print 'ERROR - cut def file provided does not exist!'
        print '   you provided --cutdef=...,'+cutdef+',...'
        print '   please check the filepath'
        print ''
        sys.exit(-1)
    f = open(cutdef)
    lines = f.readlines()
    definition = ''
    for line in lines:
        print line
        strippedline = line.strip()
        if len(strippedline) == 0:
            continue
        if strippedline[0] != '#' and len(strippedline) != 0:
            definition += line
            if len(definition.rsplit(';')) > 1:
                cf.addCut(definition.strip(';'))
                definition = ''

# compile cuts
parameters = list()
parameters.append("DUMMYVALUE = 1")
if options.cutparams:
    for cutparam in options.cutparams.split(','):
        f = open(cutparam)
        for line in f.readlines():
            parameters.append(line.strip())
parameters_string = ','.join(parameters)
cuts = cf.compileCuts(parameters_string)


histogramjobs = []
# add histogram job
if options.histdefs:
    for histdef in options.histdefs.split(','):
        if not os.path.exists(histdef):
            print 'ERROR - hist def file provided does not exist!'
            print '   you provided --histdef=...,'+histdef+',...'
            print '   please check the filepath'
            print ''
            sys.exit(-1)
        f = open(histdef)
        lines = f.readlines()
        definition = ''
        histogramjob = None
        constraints = TQNamedTaggable('constraints', 'cuts = \'*\', channel = \'\'');

        for line in lines:
            # remove whitespaces
            strippedline = line.strip()

            # if empty string continue
            if len(strippedline) == 0:
                continue

            # if constraint line process as constraint
            if strippedline[0] == '%':
                constraints.importTags(line[1:])

            # if histogram line process
            elif strippedline[0] != '#' and len(strippedline) != 0:
                definition += strippedline
                if len(definition.rsplit(';')) > 1:
                    histogramjob = TQHistoMakerAnalysisJob()
                    if options.verbose:
                        print definition.rstrip(';')
                    if not histogramjob.bookHistogram(definition.rstrip(';')):
                        print 'ERROR - failed to parse histogram definition', definition.rstrip(';')
                    else:
                        definition = ''

            if histogramjob:
                histogramjobs.append(histogramjob)
                #cuts.addAnalysisJob(histogramjob, constraints.getTagStringDefault('cuts', '*'))
                histogramjob = None

# create visitor instance
visitor = TQAnalysisSampleVisitor()

# configure visitor instance
visitor.setBaseCut(cuts)
visitor.setVerbose()


for samplekey in options.sample.split(","):

    samples = TQSampleFolder.newSampleFolder('samples')
    sample = TQSample(samplekey)

    # set metadata
    metadata = []
    for item in options.metadata.split(','):
        if not os.path.exists(item):
            print 'ERROR - metadata file provided does not exist!'
            print '   you provided --metadata = ..., ', item, ', ...'
            print '   please check the filepath'
            print ''
            sys.exit(-1)
        metadata += tool.readMetaDataFile(item)

    # set tree from metadata
    sampleFound = False
    for item in metadata:
        if item['SampleName'] == samplekey:
              treelocation = item['TreeLocation']
              if treelocation.find("eos/atlas") != -1:
                  print 'autocorrecting eos path from',treelocation
                  treelocation_tokens = treelocation.split("/")
                  treelocation = "root://eosatlas//%s" %("/".join(treelocation_tokens[treelocation_tokens.index("eos"):]))
                  print 'autocorrecting eos path to',treelocation
              exec "normalization = float("+item['Normalization']+")"
              sample.setTreeLocation(treelocation)
              sample.setNormalisation(float(normalization) * float(options.lumi))
              sample.setTagBool('usemcweights', True)
              sampleFound = True
              print item
              break

    # add copy tree job
    copytreejob = None
    if options.treejobbranch:
        branchesmetadata = []
        for treejobbranch in options.treejobbranch.split(','):
            if not os.path.exists(treejobbranch):
                print 'ERROR - tree job branch file provided does not exist!'
                print '   you provided --treejobbranch=...,'+treejobbranch+',...'
                print '   please check the filepath'
                print ''
                sys.exit(-1)
            branchesmetadata += tool.readMetaDataFile(treejobbranch)
        copytreejob = TQCopyTreeAnalysisJob()
        copytreejob.conserveTreeName(True)
        copytreejob.setTFileOpenOption("RECREATE")
        copytreejob.setTreeLocation(os.path.join(options.outdir, '%s_reduced.root:'%samplekey))
        for branchdata in branchesmetadata:
            copytreejob.addBranch(branchdata["Branch"], branchdata["Expr"])

        # add aliases
        if options.aliasdata:
            aliasdata = []
            for alias in options.aliasdata.split(','):
                if not os.path.exists(alias):
                    print 'ERROR - alias name file provided does not exist!'
                    print '   you provided --aliasdata=...,'+alias+',...'
                    print '   please check the filepath'
                    print ''
                    sys.exit(-1)
                aliasdata += tool.readMetaDataFile(alias)
            for aliasname in aliasdata:
                copytreejob.addAlias(aliasname["Branch"], aliasname["Expr"])


    # clear analysis jobs
    tool.clear_all_jobs(cuts)
    cuts.clearAnalysisJobs()
    cuts.addAnalysisJob(TQCutflowAnalysisJob(), '*')
    if copytreejob:
        cuts.addAnalysisJob(copytreejob, options.treejobcutname)
    for histogramjob in histogramjobs:
        cuts.addAnalysisJob(histogramjob, constraints.getTagStringDefault('cuts', '*'))

    # if not found error
    if not sampleFound:
        print 'ERROR - the sample you provided was not found from the metadata'
        print '   you provided --sample=', samplekey
        print '   you provided --metadata=', options.metadata
        sys.exit(-1)

    # add sample to samples
    samples.addSampleFolder(sample)

    # dump cut info
    cuts.dumpToFolder(samples.getFolder('/info/cuts+'))

    # verbose
    if options.verbose:
        tool.printObj(cuts)

    # visit the sample!
    samples.visitSampleFolders(visitor, samplekey)

    # verbose
    if options.verbose:
        #tool.printObj(cuts)
        tool.printObj(samples, 'rd')

    # write sample
    if not os.path.exists(options.outdir):
        os.makedirs(options.outdir)
    outfn = os.path.join(options.outdir, samplekey + '.root')
    print ''
    print 'writing analysis file \'%s\''%outfn
    print ''
    TFile.Open(outfn, 'RECREATE')
    samples.Write('samples', TObject.kOverwrite)

    tool.saveCommand()

#eof

#!/usr/bin/env python

#  .
# ..: Philip Chang, University of Illinois at Urbana-Champaign

import sys
import ROOT
ROOT.gROOT.Macro( '$ROOTCOREDIR/scripts/load_packages.C' )
if(not ROOT.xAOD.Init().isSuccess()): print "Failed xAOD.Init()"

#_______________________________________________________________________
class eventloop:

    # This class loops over events and runs analysis base algorithms

    def __init__(self):
        self.samples = []
        self.filenames = {}
        self.treename = ""
        self.algorithms = []

    def addSample(self, samplename):
        self.samples.append(samplename)
        self.filenames[samplename] = []

    def addFileToSample(self, samplename, filename):
        self.filenames[samplename].append(filename)

    def setTreeName(self, treename):
        self.treename = treename

    def addAlgorithm(self, algo):
        self.algorithms.append(algo)

    def process(self, maxEvents=-1):
        for sample in self.samples:
            print "eventloop:: Processing %s"%sample
            for algo in self.algorithms:
                algo.begin()
            for filename in self.filenames[sample]:
                f0 = ROOT.TFile.Open(filename)
                tree0 = ROOT.xAOD.MakeTransientTree(f0, self.treename)
                for algo in self.algorithms:
                    algo.init(tree0)
                print "eventloop:: Processing %s [#Events=%d, file=%s]"%(sample, tree0.GetEntries(), filename)
                if maxEvents == -1:
                    nevents = tree0.GetEntries()
                else:
                    nevents = maxEvents
                for entry in range(0, nevents):
                    if entry % 100 == 0: print "eventloop:: Processed [#Events=%6d, file=%s]"%(entry, filename)
                    tree0.GetEntry(entry)
                    for algo in self.algorithms:
                        algo.process()
            for algo in self.algorithms:
                algo.terminate()
#eof

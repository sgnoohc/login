#!/bin/env python
# this is an example analysis TruthStudy module file
# this studies dihiggs to bbWW final state

import roopy
from roopy.truthxaodutil import *

#from analysis import *
#from truthxaodtool import *
#import rootool

print roopy

class AnalysisWWbbTruthStudy(roopy.algorithm):

    def __init__(self, samplename = "sm_hh_bbww"):
        self.tree = 0
        self.samplename = samplename
        self.otreename = 'TruthWWbb'

    def version(self): pass

    def init(self, tree):
        self.tree = tree

    def begin(self):
        self.createOutputFile()
        self.createTree()
        #self.CreateHistograms()

    def createOutputFile(self):
        self.ofile = ROOT.TFile('outputWWbbTruthStudy.root', 'recreate')

    def createTree(self):
        self.t = roopy.data()
        self.t.createTree(self.otreename)
        self.t.create4VecBranch(self.otreename, 'h_ww')
        self.t.create4VecBranch(self.otreename, 'h_bb')
        self.t.create4VecBranch(self.otreename, 'b0')
        self.t.create4VecBranch(self.otreename, 'b1')
        self.t.create4VecBranch(self.otreename, 'W0')
        self.t.create4VecBranch(self.otreename, 'W1')
        self.t.create4VecBranch(self.otreename, 'W0f0')
        self.t.create4VecBranch(self.otreename, 'W0f1')
        self.t.create4VecBranch(self.otreename, 'W1f0')
        self.t.create4VecBranch(self.otreename, 'W1f1')
        self.t.create4VecBranch(self.otreename, 'W0m')
        self.t.create4VecBranch(self.otreename, 'W1m')
        self.t.create4VecBranch(self.otreename, 'W0mf0')
        self.t.create4VecBranch(self.otreename, 'W0mf1')
        self.t.create4VecBranch(self.otreename, 'W1mf0')
        self.t.create4VecBranch(self.otreename, 'W1mf1')
        self.t.create4VecBranch(self.otreename, 'visf0')
        self.t.create4VecBranch(self.otreename, 'visf1')
        self.t.create4VecBranch(self.otreename, 'visf2')
        self.t.create4VecBranch(self.otreename, 'visf3')
        self.t.create4VecBranch(self.otreename, 't0')
        self.t.create4VecBranch(self.otreename, 't1')
        # angular variables
        self.t.createDi4VecBranch(self.otreename, 'hh')
        self.t.createDi4VecBranch(self.otreename, 'bb')
        self.t.createDi4VecBranch(self.otreename, 'WW')
        self.t.createDi4VecBranch(self.otreename, 'W0f0W1f0')
        self.t.createDi4VecBranch(self.otreename, 'W0f1W1f0')
        self.t.createDi4VecBranch(self.otreename, 'W0f0W1f1')
        self.t.createDi4VecBranch(self.otreename, 'W0f1W1f1')
        self.t.createDi4VecBranch(self.otreename, 'W0mf0W1mf0')
        self.t.createDi4VecBranch(self.otreename, 'W0mf1W1mf0')
        self.t.createDi4VecBranch(self.otreename, 'W0mf0W1mf1')
        self.t.createDi4VecBranch(self.otreename, 'W0mf1W1mf1')
        self.t.createDi4VecBranch(self.otreename, 'visf01')
        self.t.createDi4VecBranch(self.otreename, 'visf01')
        self.t.createDi4VecBranch(self.otreename, 'tt')
        # pdgid
        self.t.createFloatBranch(self.otreename, 'W0f0_pdgId')
        self.t.createFloatBranch(self.otreename, 'W0f1_pdgId')
        self.t.createFloatBranch(self.otreename, 'W1f0_pdgId')
        self.t.createFloatBranch(self.otreename, 'W1f1_pdgId')
        self.t.createFloatBranch(self.otreename, 'W0mf0_pdgId')
        self.t.createFloatBranch(self.otreename, 'W0mf1_pdgId')
        self.t.createFloatBranch(self.otreename, 'W1mf0_pdgId')
        self.t.createFloatBranch(self.otreename, 'W1mf1_pdgId')
        # channel info
        self.t.createFloatBranch(self.otreename, 'nlep')

    def setHHbbWWBranches(self):
        self.t.set4VecBranch  ( self.otreename , 'h_ww'        , self.h_ww    )
        self.t.set4VecBranch  ( self.otreename , 'h_bb'        , self.h_bb    )
        self.t.set4VecBranch  ( self.otreename , 'b0'          , self.bs[0]   )
        self.t.set4VecBranch  ( self.otreename , 'b1'          , self.bs[1]   )
        self.t.set4VecBranch  ( self.otreename , 'W0'          , self.ws[0]   )
        self.t.set4VecBranch  ( self.otreename , 'W1'          , self.ws[1]   )
        self.t.set4VecBranch  ( self.otreename , 'W0f0'        , self.w0fs[0] )
        self.t.set4VecBranch  ( self.otreename , 'W0f1'        , self.w0fs[1] )
        self.t.set4VecBranch  ( self.otreename , 'W1f0'        , self.w1fs[0] )
        self.t.set4VecBranch  ( self.otreename , 'W1f1'        , self.w1fs[1] )
        self.t.set4VecBranch  ( self.otreename , 'W0m'         , self.wsm[0]   )
        self.t.set4VecBranch  ( self.otreename , 'W1m'         , self.wsm[1]   )
        self.t.set4VecBranch  ( self.otreename , 'W0mf0'       , self.w0mfs[0] )
        self.t.set4VecBranch  ( self.otreename , 'W0mf1'       , self.w0mfs[1] )
        self.t.set4VecBranch  ( self.otreename , 'W1mf0'       , self.w1mfs[0] )
        self.t.set4VecBranch  ( self.otreename , 'W1mf1'       , self.w1mfs[1] )
        self.t.set4VecBranch  ( self.otreename , 'visf0'       , self.visfs[0] )
        if len(self.visfs) > 1: self.t.set4VecBranch      ( self.otreename , 'visf1'       , self.visfs[1] )
        else:              self.t.set4VecBranchEmpty ( self.otreename , 'visf1')
        if len(self.visfs) > 2: self.t.set4VecBranch      ( self.otreename , 'visf2'       , self.visfs[2] )
        else:              self.t.set4VecBranchEmpty ( self.otreename , 'visf2')
        if len(self.visfs) > 3: self.t.set4VecBranch      ( self.otreename , 'visf3'       , self.visfs[3] )
        else:              self.t.set4VecBranchEmpty ( self.otreename , 'visf3')
        # angular
        self.t.setDi4VecBranch( self.otreename , 'hh', self.h_ww, self.h_bb)
        self.t.setDi4VecBranch( self.otreename , 'bb', self.bs[0], self.bs[1])
        self.t.setDi4VecBranch( self.otreename , 'WW', self.ws[0], self.ws[1])
        self.t.setDi4VecBranch( self.otreename , 'W0f0W1f0', self.w0fs[0], self.w1fs[0])
        self.t.setDi4VecBranch( self.otreename , 'W0f1W1f0', self.w0fs[1], self.w1fs[0])
        self.t.setDi4VecBranch( self.otreename , 'W0f0W1f1', self.w0fs[0], self.w1fs[1])
        self.t.setDi4VecBranch( self.otreename , 'W0f1W1f1', self.w0fs[1], self.w1fs[1])
        self.t.setDi4VecBranch( self.otreename , 'W0mf0W1mf0', self.w0mfs[0], self.w1mfs[0])
        self.t.setDi4VecBranch( self.otreename , 'W0mf1W1mf0', self.w0mfs[1], self.w1mfs[0])
        self.t.setDi4VecBranch( self.otreename , 'W0mf0W1mf1', self.w0mfs[0], self.w1mfs[1])
        self.t.setDi4VecBranch( self.otreename , 'W0mf1W1mf1', self.w0mfs[1], self.w1mfs[1])
        # pdgid
        self.t.setBranchValue ( self.otreename , 'W0f0_pdgId'  , self.w0fs[0].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W0f1_pdgId'  , self.w0fs[1].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W1f0_pdgId'  , self.w1fs[0].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W1f1_pdgId'  , self.w1fs[1].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W0mf0_pdgId' , self.w0mfs[0].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W0mf1_pdgId' , self.w0mfs[1].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W1mf0_pdgId' , self.w1mfs[0].pdgId() )
        self.t.setBranchValue ( self.otreename , 'W1mf1_pdgId' , self.w1mfs[1].pdgId() )
        # channel info
        self.t.setBranchValue ( self.otreename, 'nlep', len(self.ls)) #todo

    def setEmptyTTbarBranches(self):
        self.t.set4VecBranchEmpty(self.otreename, 't0')
        self.t.set4VecBranchEmpty(self.otreename, 't1')
        self.t.setDi4VecBranch(self.otreename, 'tt')

    def createHistograms(self):
        self.t.createHists('h_ww' , 50 , 0. , 200. , 120. , 125. , 0. , 400.)
        self.t.createHists('h_bb' , 50 , 0. , 200. , 120. , 125. , 0. , 400.)
        self.t.createHists('b0'   , 50 , 0. , 100. ,   4. ,   6. , 0. , 400.)
        self.t.createHists('b1'   , 50 , 0. , 100. ,   4. ,   6. , 0. , 200.)
        self.t.createHists('W0'   , 50 , 0. , 100. ,   0. ,  90. , 0. , 200.)
        self.t.createHists('W1'   , 50 , 0. , 100. ,   0. ,  90. , 0. , 200.)
        self.t.createHists('W0f0' , 50 , 0. , 100. ,   0. ,   6. , 0. , 100.)
        self.t.createHists('W0f1' , 50 , 0. , 100. ,   0. ,   6. , 0. , 100.)
        self.t.createHists('W1f0' , 50 , 0. , 100. ,   0. ,   6. , 0. , 100.)
        self.t.createHists('W1f1' , 50 , 0. , 100. ,   0. ,   6. , 0. , 100.)

    def fillHistograms(self):
        self.t.fillHists(self.h_ww   , 'h_ww')
        self.t.fillHists(self.h_bb   , 'h_bb')
        self.t.fillHists(self.bs[0]  , 'b0'  )
        self.t.fillHists(self.bs[1]  , 'b1'  )
        self.t.fillHists(self.ws[0]  , 'W0'  )
        self.t.fillHists(self.ws[1]  , 'W1'  )
        self.t.fillHists(self.w0fs[0], 'W0f0')
        self.t.fillHists(self.w0fs[1], 'W0f1')
        self.t.fillHists(self.w1fs[0], 'W1f0')
        self.t.fillHists(self.w1fs[1], 'W1f1')

    def process(self):
        self.selectTruthParticles()
        if self.samplename == "sm_hh_bbww":
            self.selectHHbbWWProcess()
            self.setHHbbWWBranches()
        else:
            self.setEmptyTTbarBranches()
        self.t.fillTree(self.otreename)

    def selectTruthParticles(self):
        self.parseTruthParticles()

    def parseTruthParticles(self):
        self.collection = parseTruthParticles(self.tree.TruthParticles)

    def selectHHbbWWProcess(self):
        self.selectHiggses()
        self.selectHWW()
        self.selectHbb()
        self.selectWs()
        self.selectbs()
        self.selectWDecays()
        self.selectVisWDecays()

    def selectHiggses(self):
        self.hs = []
        for higgs in self.collection["Higgs"]:
            if higgs.status() == 62:
                self.hs.append(higgs)

    def getHxx(self, abs_pdgid):
        for higgs in self.hs:
            if abs(higgs.child(0).pdgId()) == abs_pdgid:
                return higgs

    def selectHbb(self):
        self.h_bb = self.getHxx(5)

    def selectHWW(self):
        self.h_ww = self.getHxx(24)

    def getXX(self, h):
        children = []
        for ich in xrange(h.nChildren()):
            children.append(h.child(ich))
        return children

    def selectWs(self):
        self.ws = self.getXX(self.h_ww)
        self.ws = sortbypt(self.ws)
        self.wsm = sortbymass(self.ws)

    def selectbs(self):
        self.bs = self.getXX(self.h_bb)
        self.bs = sortbypt(self.bs)

    def selectWDecays(self):
        self.w0fs = self.getXX(self.ws[0])
        self.w0fs = sortbypt(self.w0fs)
        self.w1fs = self.getXX(self.ws[1])
        self.w1fs = sortbypt(self.w1fs)
        self.w0mfs = self.getXX(self.wsm[0])
        self.w0mfs = sortbypt(self.w0mfs)
        self.w1mfs = self.getXX(self.wsm[1])
        self.w1mfs = sortbypt(self.w1mfs)

    def selectVisWDecays(self):
        self.visfs = []
        self.vs = []
        self.ls = []
        self.qs = []
        for f in self.w0fs:
            if abs(f.pdgId()) in [12, 14, 16]:
                self.vs.append(f)
            else:
                self.visfs.append(f)
            if abs(f.pdgId()) in [11, 13]:
                self.ls.append(f)
            if abs(f.pdgId()) in [1, 2, 3, 4, 5]:
                self.qs.append(f)
        for f in self.w1fs:
            if abs(f.pdgId()) in [12, 14, 16]:
                self.vs.append(f)
            else:
                self.visfs.append(f)
            if abs(f.pdgId()) in [11, 13]:
                self.ls.append(f)
            if abs(f.pdgId()) in [1, 2, 3, 4, 5]:
                self.qs.append(f)
        self.visfs = sortbypt(self.visfs)
        self.vs = sortbypt(self.vs)
        self.ls = sortbypt(self.ls)
        self.qs = sortbypt(self.qs)

    def terminate(self):
        self.t.writeTreeToFile(self.otreename, self.ofile)
        self.t.writeHists(self.ofile)
        self.ofile.Close()

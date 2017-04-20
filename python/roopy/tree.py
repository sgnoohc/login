#!/usr/bin/env python

#  .
# ..: Philip Chang, University of Illinois at Urbana-Champaign

import ROOT

try:
    import ROOT
except:
    import sys
    print 'ERROR - TTreeHelper needs ROOT!!!'
    print 'is PyROOT setup properly? "import ROOT" failed'
    sys.exit(-1)
try:
    import array
except:
    import sys
    print 'ERROR - TTreeHelper needs array!!!'
    sys.exit(-1)

#_______________________________________________________________________
class tree:

    # this class holds histograms and ttree for writing outputs

    def __init__(self):
        self.data = dict()
        self.hists = dict()
    def createTree(self, name):
        self.data[name] = {'tree': ROOT.TTree(name, name), 'branch': dict()}
    def createFloatBranch(self, treename, branchname):
        self.data[treename]['branch'][branchname] = array.array('f', [0])
        self.data[treename]['tree'].Branch(branchname, self.data[treename]['branch'][branchname], branchname+'/F')
    def clearFloatBranches(self, treename):
        branches = self.data[treename]['branch']
        for branchname in branches:
            self.setBranchValue(treename, branchname, -999)
    def setBranchValue(self, treename, branchname, val):
        self.data[treename]['branch'][branchname][0] = val;
    def create4VecBranch(self, treename, name):
        self.createFloatBranch(treename, name+'_pt')
        self.createFloatBranch(treename, name+'_eta')
        self.createFloatBranch(treename, name+'_phi')
        self.createFloatBranch(treename, name+'_m')
        self.createFloatBranch(treename, name+'_e')
        self.createFloatBranch(treename, name+'_y')
    def createVtxBranch(self, treename, name):
        self.createFloatBranch(treename, name+'_prod_vtx_x')
        self.createFloatBranch(treename, name+'_prod_vtx_y')
        self.createFloatBranch(treename, name+'_prod_vtx_z')
        self.createFloatBranch(treename, name+'_prod_vtx_perp')
        self.createFloatBranch(treename, name+'_prod_vtx_eta')
        self.createFloatBranch(treename, name+'_prod_vtx_phi')
        self.createFloatBranch(treename, name+'_dec_vtx_x')
        self.createFloatBranch(treename, name+'_dec_vtx_y')
        self.createFloatBranch(treename, name+'_dec_vtx_z')
        self.createFloatBranch(treename, name+'_dec_vtx_perp')
        self.createFloatBranch(treename, name+'_dec_vtx_eta')
        self.createFloatBranch(treename, name+'_dec_vtx_phi')
    def set4VecBranchEmpty(self, treename, name):
        emptyvec = ROOT.TLorentzVector()
        self.set4VecBranch(treename, name, emptyvec)
    def set4VecBranch(self, treename, name, particle):
        if particle.__class__.__name__ == 'xAOD::TruthParticle_v1':
            self.set4VecBranchIParticle(treename, name, particle)
        elif particle.__class__.__name__ == 'TLorentzVector':
            self.set4VecBranchTLV(treename, name, particle)
    def setVtxBranchEmpty(self, treename, name):
        self.setBranchValue(treename , name+'_prod_vtx_x'    , 0)
        self.setBranchValue(treename , name+'_prod_vtx_y'    , 0)
        self.setBranchValue(treename , name+'_prod_vtx_z'    , 0)
        self.setBranchValue(treename , name+'_prod_vtx_perp' , 0)
        self.setBranchValue(treename , name+'_prod_vtx_eta'  , 0)
        self.setBranchValue(treename , name+'_prod_vtx_phi'  , 0)
        self.setBranchValue(treename , name+'_dec_vtx_x'     , 0)
        self.setBranchValue(treename , name+'_dec_vtx_y'     , 0)
        self.setBranchValue(treename , name+'_dec_vtx_z'     , 0)
        self.setBranchValue(treename , name+'_dec_vtx_perp'  , 0)
        self.setBranchValue(treename , name+'_dec_vtx_eta'   , 0)
        self.setBranchValue(treename , name+'_dec_vtx_phi'   , 0)
    def setVtxBranch(self, treename, name, particle):
        if particle.hasProdVtx():
            self.setBranchValue(treename , name+'_prod_vtx_x'    , particle.prodVtx().x())
            self.setBranchValue(treename , name+'_prod_vtx_y'    , particle.prodVtx().y())
            self.setBranchValue(treename , name+'_prod_vtx_z'    , particle.prodVtx().z())
            self.setBranchValue(treename , name+'_prod_vtx_perp' , particle.prodVtx().perp())
            self.setBranchValue(treename , name+'_prod_vtx_eta'  , particle.prodVtx().eta())
            self.setBranchValue(treename , name+'_prod_vtx_phi'  , particle.prodVtx().phi())
        else:
            self.setBranchValue(treename , name+'_prod_vtx_x'    , 0)
            self.setBranchValue(treename , name+'_prod_vtx_y'    , 0)
            self.setBranchValue(treename , name+'_prod_vtx_z'    , 0)
            self.setBranchValue(treename , name+'_prod_vtx_perp' , 0)
            self.setBranchValue(treename , name+'_prod_vtx_eta'  , 0)
            self.setBranchValue(treename , name+'_prod_vtx_phi'  , 0)
        if particle.hasDecayVtx():
            self.setBranchValue(treename , name+'_dec_vtx_x'     , particle.decayVtx().x())
            self.setBranchValue(treename , name+'_dec_vtx_y'     , particle.decayVtx().y())
            self.setBranchValue(treename , name+'_dec_vtx_z'     , particle.decayVtx().z())
            self.setBranchValue(treename , name+'_dec_vtx_perp'  , particle.decayVtx().perp())
            self.setBranchValue(treename , name+'_dec_vtx_eta'   , particle.decayVtx().eta())
            self.setBranchValue(treename , name+'_dec_vtx_phi'   , particle.decayVtx().phi())
        else:
            self.setBranchValue(treename , name+'_dec_vtx_x'     , 0)
            self.setBranchValue(treename , name+'_dec_vtx_y'     , 0)
            self.setBranchValue(treename , name+'_dec_vtx_z'     , 0)
            self.setBranchValue(treename , name+'_dec_vtx_perp'  , 0)
            self.setBranchValue(treename , name+'_dec_vtx_eta'   , 0)
            self.setBranchValue(treename , name+'_dec_vtx_phi'   , 0)
    def set4VecBranchIParticle(self, treename, name, particle):
        self.setBranchValue(treename, name+'_pt', particle.pt())
        self.setBranchValue(treename, name+'_eta', particle.eta())
        self.setBranchValue(treename, name+'_phi', particle.phi())
        self.setBranchValue(treename, name+'_m', particle.m())
        self.setBranchValue(treename, name+'_e', particle.e())
        self.setBranchValue(treename, name+'_y', particle.rapidity())
    def set4VecBranchTLV(self, treename, name, particle):
        self.setBranchValue(treename, name+'_pt', particle.Pt())
        if particle.Pt() != 0:
            self.setBranchValue(treename, name+'_eta', particle.Eta())
        else:
            self.setBranchValue(treename, name+'_eta', -999)
        if particle.Pt() != 0:
            self.setBranchValue(treename, name+'_phi', particle.Phi())
        else:
            self.setBranchValue(treename, name+'_phi', -999)
        self.setBranchValue(treename, name+'_m', particle.M())
        self.setBranchValue(treename, name+'_e', particle.E())
        if particle.Pt() != 0:
            self.setBranchValue(treename, name+'_y', particle.Rapidity())
        else:
            self.setBranchValue(treename, name+'_y', -999)
    def createDi4VecBranch(self, treename, name):
        self.create4VecBranch(treename,  name)
        self.createFloatBranch(treename, name+'_dr')
        self.createFloatBranch(treename, name+'_dphi')
        self.createFloatBranch(treename, name+'_deta')
        self.createFloatBranch(treename, name+'_dy')
        self.createFloatBranch(treename, name+'_dpt')
        self.createFloatBranch(treename, name+'_dE')
        self.createFloatBranch(treename, name+'_dM')
    def setDi4VecBranch(self, treename, name, particle0, particle1):
        p0 = 0
        p1 = 0
        if particle0.__class__.__name__ == 'xAOD::TruthParticle_v1':
            p0 = self.buildTLVfromIParticle(particle0)
        elif particle0.__class__.__name__ == 'TLorentzVector':
            p0 = particle0
        if particle1.__class__.__name__ == 'xAOD::TruthParticle_v1':
            p1 = self.buildTLVfromIParticle(particle1)
        elif particle1.__class__.__name__ == 'TLorentzVector':
            p1 = particle1
        self.setDi4VecBranchTLV(treename, name, p0, p1)
    def buildTLVfromIParticle(self, particle):
        result = ROOT.TLorentzVector()
        result.SetPtEtaPhiM(particle.pt(), particle.eta(), particle.phi(), particle.m())
        return result
    def setDi4VecBranchTLV(self, treename, name, p0, p1):
        self.set4VecBranch(treename,  name, p0+p1)
        self.setBranchValue(treename, name+'_dr', p0.DeltaR(p1))
        self.setBranchValue(treename, name+'_dphi', p0.DeltaPhi(p1))
        self.setBranchValue(treename, name+'_deta', p0.Eta()-p1.Eta())
        self.setBranchValue(treename, name+'_dy', p0.Rapidity()-p1.Rapidity())
        self.setBranchValue(treename, name+'_dpt', p0.Pt()-p1.Pt())
        self.setBranchValue(treename, name+'_dE', p0.E()-p1.E())
        self.setBranchValue(treename, name+'_dM', p0.M()-p1.M())
    def setDi4VecBranchEmpty(self, treename, name):
        p0 = ROOT.TLorentzVector()
        p1 = ROOT.TLorentzVector()
        self.setDi4VecBranch(treename, name, p0, p1)
    def fillTree(self, treename):
        self.data[treename]['tree'].Fill()
    def writeTreeToFile(self, treename, ofile):
        ofile.cd()
        self.data[treename]['tree'].Write()
    def createHists(self, name, nbin, ptmin, ptmax, mmin, mmax, emin, emax):
        self.hists[name] = dict()
        self.hists[name]['pt']  = ROOT.TH1F(name + '_pt'  , '' , nbin , ptmin  , ptmax)
        self.hists[name]['eta'] = ROOT.TH1F(name + '_eta' , '' , nbin , -5 , 5)
        self.hists[name]['rap'] = ROOT.TH1F(name + '_rap' , '' , nbin , -5 , 5)
        self.hists[name]['phi'] = ROOT.TH1F(name + '_phi' , '' , nbin , -ROOT.TMath.Pi() , ROOT.TMath.Pi())
        self.hists[name]['m']   = ROOT.TH1F(name + '_m'   , '' , nbin , mmin   , mmax)
        self.hists[name]['e']   = ROOT.TH1F(name + '_e'   , '' , nbin , emin   , emax)
        # style
        self.hists[name]['pt']  .GetXaxis().SetTitle('#it{p}_{T,'+name+'} [GeV]')
        self.hists[name]['eta'] .GetXaxis().SetTitle('#it{#eta}_{'+name+'}')
        self.hists[name]['rap'] .GetXaxis().SetTitle('#it{y}_{'+name+'}')
        self.hists[name]['phi'] .GetXaxis().SetTitle('#it{#phi}_{'+name+'} [rad]')
        self.hists[name]['m']   .GetXaxis().SetTitle('#it{m}_{'+name+'} [GeV]')
        self.hists[name]['e']   .GetXaxis().SetTitle('#it{E}_{'+name+'} [GeV]')
        self.hists[name]['pt']  .GetYaxis().SetTitle('# Events')
        self.hists[name]['eta'] .GetYaxis().SetTitle('# Events')
        self.hists[name]['rap'] .GetYaxis().SetTitle('# Events')
        self.hists[name]['phi'] .GetYaxis().SetTitle('# Events')
        self.hists[name]['m']   .GetYaxis().SetTitle('# Events')
        self.hists[name]['e']   .GetYaxis().SetTitle('# Events')
        self.hists[name]['pt']  .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['eta'] .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['rap'] .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['phi'] .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['m']   .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['e']   .GetXaxis().SetTitleSize(0.05)
        self.hists[name]['pt']  .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['eta'] .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['rap'] .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['phi'] .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['m']   .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['e']   .GetYaxis().SetTitleSize(0.05)
        self.hists[name]['pt']  .SetLineColor(ROOT.kBlack)
        self.hists[name]['eta'] .SetLineColor(ROOT.kBlack)
        self.hists[name]['rap'] .SetLineColor(ROOT.kBlack)
        self.hists[name]['phi'] .SetLineColor(ROOT.kBlack)
        self.hists[name]['m']   .SetLineColor(ROOT.kBlack)
        self.hists[name]['e']   .SetLineColor(ROOT.kBlack)
        self.hists[name]['pt']  .SetFillColor(ROOT.kYellow)
        self.hists[name]['eta'] .SetFillColor(ROOT.kYellow)
        self.hists[name]['rap'] .SetFillColor(ROOT.kYellow)
        self.hists[name]['phi'] .SetFillColor(ROOT.kYellow)
        self.hists[name]['m']   .SetFillColor(ROOT.kYellow)
        self.hists[name]['e']   .SetFillColor(ROOT.kYellow)
    def fillHists(self, truth, name):
        self.hists[name]['pt'].Fill(truth.pt() / 1000.)
        self.hists[name]['rap'].Fill(truth.rapidity())
        self.hists[name]['eta'].Fill(truth.eta())
        self.hists[name]['phi'].Fill(truth.phi())
        self.hists[name]['m'].Fill(truth.m() / 1000.)
        self.hists[name]['e'].Fill(truth.e() / 1000.)
    def writeHists(self, ofile):
        ofile.cd()
        for key in self.hists:
            for var in self.hists[key]:
                self.hists[key][var].Write()
    def resetHists(self):
        for key in self.hists:
            for var in self.hists[key]:
                self.hists[key][var].Reset()

##_______________________________________________________________________
## Custom
#def getp4(particle):
#    vec = ROOT.TLorentzVector()
#    vec.SetPtEtaPhiM(particle.pt(), particle.eta(), particle.phi(), particle.m())
#    return vec

#eof

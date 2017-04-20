import ROOT
#__________________________________________________________________________________
# single print of a truth particle with typically relevant info
def printTruthParticle(truth, indent = 0):
    prodvtx_perp = 0
    prodvtx_eta = 0
    prodvtx_phi = 0
    prodvtx_t = 0
    decayvtx_perp = 0
    decayvtx_eta = 0
    decayvtx_phi = 0
    decayvtx_t = 0
    if truth.hasProdVtx():
        prodvtx_perp = truth.prodVtx().perp()
        prodvtx_eta = truth.prodVtx().eta()
        prodvtx_phi = truth.prodVtx().phi()
        prodvtx_t = truth.prodVtx().t()
    if truth.hasDecayVtx():
        decayvtx_perp = truth.decayVtx().perp()
        decayvtx_eta = truth.decayVtx().eta()
        decayvtx_phi = truth.decayVtx().phi()
        decayvtx_t = truth.decayVtx().t()
    if truth.pt() > 1e-3:
        string = \
'PdgId=%5d, barcode=%6d, Status=%3d, (Pt,Eta,Phi,M,E)=(%7.2f,%5.2f,%5.2f,%5.2f,%6.2f),\
nChildren=%3d, nParents=%3d, prodVtx(Perp,Eta,Phi,T)=(%4.2f,%4.2f,%4.2f,%4.2f),\
decayVtx(Perp,Eta,Phi,T)=(%4.2f, %4.2f,%4.2f,%4.2f)'%(truth.pdgId(), truth.barcode(), truth.status(),\
truth.pt()/1000., truth.eta(), truth.phi(), truth.m()/1000., truth.e()/1000., truth.nChildren(),\
truth.nParents(), prodvtx_perp, prodvtx_eta, prodvtx_phi, prodvtx_t, decayvtx_perp,\
decayvtx_eta, decayvtx_phi, decayvtx_t)
    else:
        string = \
'PdgId=%5d, barcode=%6d, Status=%3d, (Pt,Eta,Phi,M,E)=(%7.2f,%5.2f,%5.2f,%5.2f,%6.2f),\
nChildren=%3d, nParents=%3d, prodVtx(Perp,Eta,Phi,T)=(%4.2f,%4.2f,%4.2f,%4.2f),\
decayVtx(Perp,Eta,Phi,T)=(%4.2f, %4.2f,%4.2f,%4.2f)'%(truth.pdgId(), truth.barcode(), truth.status(),\
truth.pt()/1000., -999, truth.phi(), truth.m()/1000., truth.e()/1000., truth.nChildren(),\
truth.nParents(), prodvtx_perp, prodvtx_eta, prodvtx_phi, prodvtx_t, decayvtx_perp,\
decayvtx_eta, decayvtx_phi, decayvtx_t)

    print string.rjust(len(string)+indent)

#__________________________________________________________________________________
# multi print of a truth particle with typically relevant info
def printTruthParticles(truths):
    for truth in truths:
        printTruthParticle(truth)

#__________________________________________________________________________________
# print list of parents of a particle
def printParents(particle):
    #printTruthParticle(particle)
    print "---parents---"
    for i in xrange(particle.nParents()):
        printTruthParticle(particle.parent(i), 2)
    print "---/parents---"

#__________________________________________________________________________________
def printChildren(particle):
    #printTruthParticle(particle)
    print "---children---"
    for i in xrange(particle.nChildren()):
        printTruthParticle(particle.child(i), 2)
    print "---/children---"

#__________________________________________________________________________________
def printParentTree(particle, indent=0):
    printTruthParticle(particle, indent)
    if indent == 0:
        print "---parent tree---"
    for i in xrange(particle.nParents()):
        printParentTree(particle.parent(i), indent+1)
    if indent == 0:
        print "---/parent tree---"

#__________________________________________________________________________________
def printChildrenTree(particle, depth=0, indent=0):
    if indent == 0:
        print "---children tree---"
    if depth > 0:
        if indent < depth:
            printTruthParticle(particle, indent)
            for i in xrange(particle.nChildren()):
                printChildrenTree(particle.child(i), depth, indent+1)
    else:
        printTruthParticle(particle, indent)
        for i in xrange(particle.nChildren()):
            printChildrenTree(particle.child(i), depth, indent+1)
    if indent == 0:
        print "---/children tree---"

#__________________________________________________________________________________
def isHadronicTau(particle):
    for i in xrange(particle.nChildren()):
        child = particle.child(i)
        if abs(child.pdgId()) in [111,130,211,221,223,310,311,321,323]:
            return True
        elif abs(child.pdgId()) in [11,13]:
            return False

#__________________________________________________________________________________
def isWeaklyDecayingBHadron(particle):
    abs_mc_pdgId = abs(particle.pdgId())
    if  abs_mc_pdgId==511  or abs_mc_pdgId==521  or abs_mc_pdgId==531  or\
        abs_mc_pdgId==541  or abs_mc_pdgId==5112 or abs_mc_pdgId==5122 or\
        abs_mc_pdgId==5132 or abs_mc_pdgId==5142 or abs_mc_pdgId==5212 or\
        abs_mc_pdgId==5222 or abs_mc_pdgId==5232 or abs_mc_pdgId==5242 or\
        abs_mc_pdgId==5332:
        return True
    else:
        return False

#__________________________________________________________________________________
def isWeaklyDecayingBHadronFromOrigin(particle):
    if isWeaklyDecayingBHadron(particle):
        if particle.prodVtx().x() == 0 and particle.prodVtx().y() == 0 and particle.prodVtx().z() == 0:
            return True
        else:
            return False
    else:
        return False

#__________________________________________________________________________________
def isWeaklyDecayingBHadronFromOriginToSomeDistance(particle):
    if isWeaklyDecayingBHadronFromOrigin(particle):
        if particle.decayVtx().x() != 0 and particle.decayVtx().y() != 0 and particle.decayVtx().z() != 0:
            return True
        else:
            return False
    else:
        return False

#__________________________________________________________________________________
def getWeaklyDecayingBHadronChild(particle):
    for i in xrange(particle.nChildren()):
        child = particle.child(i)
        if isWeaklyDecayingBHadron(child):
            return child
        else:
            return getWeaklyDecayingBHadronChild(child)
    return False

#__________________________________________________________________________________
def getLeptonChild(particle):
    for i in xrange(particle.nChildren()):
        child = particle.child(i)
        #printTruthParticle(child)
        if abs(child.pdgId()) in [13] and child.status() == 1:
            return child
        else:
            child = getLeptonChild(child)
            if child:
                return child
    return False

#__________________________________________________________________________________
def getLeptonFromLeptonicTau(particle):
    for i in xrange(particle.nChildren()):
        child = particle.child(i)
        if abs(child.pdgId()) in [11,13]:
            return child

#__________________________________________________________________________________
def find_higgs_origin(higgs):
    if higgs.nParents() == 2:
        return higgs
    elif higgs.nParents() == 1:
        return find_higgs_origin(higgs.parent(0))

#__________________________________________________________________________________
def vtxmatch(parents, children, drthresh):
    matched_pair = dict()
    childrencopy = list(children)
    for parent in parents:
        parentp4 = ROOT.TLorentzVector()
        parentp4.SetPtEtaPhiM(parent.decayVtx().perp(), parent.decayVtx().eta(), parent.decayVtx().phi(), parent.decayVtx().t())
        for child in childrencopy:
            childp4 = ROOT.TLorentzVector()
            childp4.SetPtEtaPhiM(child.prodVtx().perp(), child.prodVtx().eta(), child.prodVtx().phi(), child.prodVtx().t())
            if parentp4.DeltaR(childp4) < drthresh:
                matched_pair[parent.barcode()] = child.barcode()
                childrencopy.remove(child)
                break
    return matched_pair

#__________________________________________________________________________________
def drmatch(refs, cands, drthresh):
    matched_pair = dict()
    candscopy = list(cands)
    for ref in refs:
        refp4 = ROOT.TLorentzVector()
        refp4.SetPtEtaPhiM(ref.pt(), ref.eta(), ref.phi(), ref.m())
        for cand in candscopy:
            candp4 = ROOT.TLorentzVector()
            candp4.SetPtEtaPhiM(cand.pt(), cand.eta(), cand.phi(), cand.m())
            if candp4.DeltaR(refp4) < drthresh:
                matched_pair[ref] = cand
                candscopy.remove(cand)
                break
    return matched_pair

#__________________________________________________________________________________
def parseTruthParticles(particles):
    collection = dict()
    collection["Charged"] = []
    collection["Neutral"] = []
    collection["Photon"] = []
    collection["Photon"] = []
    collection["Lepton"] = []
    collection["ChLepton"] = []
    collection["Electron"] = []
    collection["Muon"] = []
    collection["Tau"] = []
    collection["Neutrino"] = []
    collection["Hadron"] = []
    collection["Meson"] = []
    collection["Baryon"] = []
    collection["Strange"] = []
    collection["Charm"] = []
    collection["Bottom"] = []
    collection["LightMeson"] = []
    collection["LightBaryon"] = []
    collection["LightHadron"] = []
    collection["HeavyMeson"] = []
    collection["HeavyBaryon"] = []
    collection["HeavyHadron"] = []
    collection["BottomMeson"] = []
    collection["BottomBaryon"] = []
    collection["BottomHadron"] = []
    collection["CharmMeson"] = []
    collection["CharmBaryon"] = []
    collection["CharmHadron"] = []
    collection["StrangeMeson"] = []
    collection["StrangeBaryon"] = []
    collection["StrangeHadron"] = []
    collection["Quark"] = []
    collection["Parton"] = []
    collection["Top"] = []
    collection["W"] = []
    collection["Z"] = []
    collection["Higgs"] = []
    collection["Scalar"] = []
    collection["WDBH"] = []
    for i in xrange(particles.size()):
        truth = particles.at(i)
        if truth.isCharged(): collection["Charged"].append(truth)
        if truth.isNeutral(): collection["Neutral"].append(truth)
        if truth.isPhoton(): collection["Photon"].append(truth)
        if truth.isPhoton(): collection["Photon"].append(truth)
        if truth.isLepton(): collection["Lepton"].append(truth)
        if truth.isChLepton(): collection["ChLepton"].append(truth)
        if truth.isElectron(): collection["Electron"].append(truth)
        if truth.isMuon(): collection["Muon"].append(truth)
        if truth.isTau(): collection["Tau"].append(truth)
        if truth.isNeutrino(): collection["Neutrino"].append(truth)
        if truth.isHadron(): collection["Hadron"].append(truth)
        if truth.isMeson(): collection["Meson"].append(truth)
        if truth.isBaryon(): collection["Baryon"].append(truth)
        if truth.hasStrange(): collection["Strange"].append(truth)
        if truth.hasCharm(): collection["Charm"].append(truth)
        if truth.hasBottom(): collection["Bottom"].append(truth)
        if truth.isLightMeson(): collection["LightMeson"].append(truth)
        if truth.isLightBaryon(): collection["LightBaryon"].append(truth)
        if truth.isLightHadron(): collection["LightHadron"].append(truth)
        if truth.isHeavyMeson(): collection["HeavyMeson"].append(truth)
        if truth.isHeavyBaryon(): collection["HeavyBaryon"].append(truth)
        if truth.isHeavyHadron(): collection["HeavyHadron"].append(truth)
        if truth.isBottomMeson(): collection["BottomMeson"].append(truth)
        if truth.isBottomBaryon(): collection["BottomBaryon"].append(truth)
        if truth.isBottomHadron(): collection["BottomHadron"].append(truth)
        if truth.isCharmMeson(): collection["CharmMeson"].append(truth)
        if truth.isCharmBaryon(): collection["CharmBaryon"].append(truth)
        if truth.isCharmHadron(): collection["CharmHadron"].append(truth)
        if truth.isStrangeMeson(): collection["StrangeMeson"].append(truth)
        if truth.isStrangeBaryon(): collection["StrangeBaryon"].append(truth)
        if truth.isStrangeHadron(): collection["StrangeHadron"].append(truth)
        if truth.isQuark(): collection["Quark"].append(truth)
        if truth.isParton(): collection["Parton"].append(truth)
        if truth.isTop(): collection["Top"].append(truth)
        if truth.isW(): collection["W"].append(truth)
        if truth.isZ(): collection["Z"].append(truth)
        if truth.isHiggs(): collection["Higgs"].append(truth)
        if abs(truth.pdgId()) == 35: collection["Higgs"].append(truth)
        if abs(truth.pdgId()) == 36: collection["Scalar"].append(truth)
        # custom version
        if isWeaklyDecayingBHadronFromOriginToSomeDistance(truth): collection["WDBH"].append(truth)
    return collection

#__________________________________________________________________________________
def sortbypt(coll): return sorted(coll, key=lambda particle: particle.pt(), reverse=True)
def sortbymass(coll): return sorted(coll, key=lambda particle: particle.m(), reverse=True)


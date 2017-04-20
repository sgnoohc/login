import ROOT
import sys

# EDIT HERE
# EDIT HERE
# EDIT HERE
def get_label(pid):
    if   pid == 1 or pid == -1  : name = "u"
    elif pid == 2 or pid == -2  : name = "d"
    elif pid == 5   : name = "u"
    elif pid == -5  : name = "d"
    elif pid == -11 : name = "e+"
    elif pid == 11  : name = "e-"
    elif pid == -12 : name = "ve"
    elif pid == 12  : name = "ve~"
    return name

parentparticles = ["dijet", "wp", "wm", "h"]
parentmap = {}
parentmap["dijet"] = ["u", "d"]
parentmap["wp"]  = ["e+", "ve"]
parentmap["wm"]  = ["e-", "ve~"]
parentmap["h"]   = ["e+", "ve", "e-", "ve~"]

childtoordermap = {}
childtoordermap["lep"] = ["e+", "e-"]
childtoordermap["jet"] = ["u", "d"]
# EDIT HERE
# EDIT HERE
# EDIT HERE

try:
    inputfilepath = sys.argv[1]
except:
    print "must provide input file"
    sys.exit(-1)

ROOT.gROOT.SetBatch(True)

rfile = ROOT.TFile.Open(inputfilepath)
ttree = rfile.Get("Physics")

pidlist = []
for index, event in enumerate(ttree):
    tmppidlist = []
    for i in event.PID:
        tmppidlist.append(i)

    if index == 0:
        pidlist = tmppidlist
    else:
        tmp_set = set(tmppidlist)
        pidset = set(pidlist)
        pidset = pidset.intersection(tmp_set)

childlist = list(pidset)
print "child list", childlist

childparticles = []
for i in childlist:
    childparticles.append(get_label(i))
print "childparticles", childparticles

ofile = ROOT.TFile.Open("signal.root", "recreate")
otree = ROOT.TTree("AnaTree", "AnaTree")

components = ["Pt", "Eta", "Phi", "E", "M", "Pz", "DeltaPhi", "DeltaEta"]

processline = "struct AnaTreeBranches {"
for item in childparticles + parentparticles:
    item = item.replace("+","p").replace("-", "m").replace("~", "x")
    for component in components:
        processline += "Float_t %s_%s;" % (item, component)
for item in childtoordermap:
    for index in range(0, len(childtoordermap[item])):
        item = item.replace("+","p").replace("-", "m").replace("~", "x")
        for component in components:
            processline += "Float_t %s%d_%s;" % (item, index, component)
processline += "}"

ROOT.gROOT.ProcessLine(processline)

anatreebranches = ROOT.AnaTreeBranches()

def get_particle_ascii_name(nicename):
    return nicename.replace("+","p").replace("-", "m").replace("~", "x")

def get_branch_name(nicename, component):
    return "%s_%s" % (nicename, component)

for item in childparticles + parentparticles:
    item = get_particle_ascii_name(item)
    for component in components:
        branchname = get_branch_name(item, component)
        otree.Branch(branchname, ROOT.AddressOf(anatreebranches, branchname), branchname + "/F")
for item in childtoordermap:
    for index in range(0, len(childtoordermap[item])):
        item = item.replace("+","p").replace("-", "m").replace("~", "x")
        for component in components:
            branchname = get_branch_name(item+str(index), component)
            otree.Branch(branchname, ROOT.AddressOf(anatreebranches, branchname), branchname + "/F")

def clear_anatreebranches():
    for item in childparticles + parentparticles:
        item = get_particle_ascii_name(item)
        for component in components:
            branchname = get_branch_name(item, component)
            exec "anatreebranches.%s = -9999" % (branchname)
    for item in childtoordermap:
        for index in range(0, len(childtoordermap[item])):
            item = item.replace("+","p").replace("-", "m").replace("~", "x")
            for component in components:
                branchname = get_branch_name(item+str(index), component)
                exec "anatreebranches.%s = -9999" % (branchname)

def set_anatreebranch(asciiname, momentum):
    for component in components:
        if component.find("Delta") == -1:
            branchname = get_branch_name(asciiname, component)
            exec "anatreebranches.%s = %f" % (branchname, getattr(momentum, component)())

def set_anatreebranches(momenta):
    for key in momenta:
        item = get_particle_ascii_name(key)
        set_anatreebranch(item, momenta[key])


for event in ttree:

    momenta = {}

    clear_anatreebranches()

    for index, pid in enumerate(event.PID):

        #if childlist[index] != pid:
        #    sys.exit("pid order does not macth with the provided child list")

        momentum = ROOT.TLorentzVector()
        momentum.SetPxPyPzE(event.P_X[index], event.P_Y[index], event.P_Z[index], event.E[index])
        childindex = -1
        #for tmpindex, childpid in enumerate(childlist):
        #    if pid == childpid:
        #        childindex = tmpindex
        label = get_label(pid)
        momenta[label] = momentum
        #momenta[childparticles[childindex]] = momentum

    for parentkey in parentparticles:
        momentum = ROOT.TLorentzVector()
        for childlabel in parentmap[parentkey]:
            momentum += momenta[childlabel]
            momenta[parentkey] = momentum
        if len(parentmap[parentkey]) == 2:
            mom0 = momenta[parentmap[parentkey][0]]
            mom1 = momenta[parentmap[parentkey][1]]
            item = get_particle_ascii_name(parentkey)
            branchname = get_branch_name(item, "DeltaPhi")
            exec "anatreebranches.%s = %f" % (branchname, mom0.DeltaPhi(mom1))
            branchname = get_branch_name(item, "DeltaEta")
            exec "anatreebranches.%s = %f" % (branchname, abs(mom0.Eta() - mom1.Eta()))

    for key in childtoordermap:
        toorder = []
        for child in childtoordermap[key]:
            toorder.append(momenta[child])
        toorder.sort(key=lambda x: x.Pt(), reverse=True)
        for index in range(0, len(childtoordermap[key])):
            momenta[key+str(index)] = toorder[index]



    set_anatreebranches(momenta)

    otree.Fill()

otree.Write()
ofile.Close()

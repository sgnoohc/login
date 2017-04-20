//  .  Philip Chang, <phchang@cern.ch
// ..: University of Illinois

#ifndef TPhysicsTool_h
#define TPhysicsTool_h

#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>
#include <TObjArray.h>
#include <TBranch.h>
#include <TLeaf.h>
#include <TLorentzVector.h>
#include <TTreeFormula.h>

#include <cstdlib>
#include <iostream>
#include <map>
#include <string>
#include <vector>

//___________________________________________________________________________________________
// classes or namespaces

// level-2
class PObject : public TLorentzVector {
  private :
    Int_t index;
    TString prefix;
  public :
    PObject():TLorentzVector(), index(0), prefix("") {}
    ~PObject(){}
    void SetIndex(Int_t idx) { index = idx; }
    void SetPrefix(TString pfx) { prefix = pfx; }
    void PrintTLV(Bool_t newline=true)
    {
      if (newline) printf("Pt=%9.2f Eta=%7.2f Phi=%7.2f E=%9.2f M=%9.2f\n", Pt(), Eta(), Phi(), E(), M());
      else printf("Pt=%9.2f Eta=%7.2f Phi=%7.2f E=%9.2f M=%9.2f, ", Pt(), Eta(), Phi(), E(), M());
    }
};

// level-1
namespace PTool {
  void FilterTLVs(std::vector<PObject>* tlvs, float minpt, float eta=6.0, bool lt=true, float maxpt=9999999999999);
};

class TTreeWrapper {
  public :
    TTree          *fChain;   //!pointer to the analyzed TTree or TChain
    Int_t           fCurrent; //!current Tree number in a TChain

    typedef std::map<TString, Int_t> mapInt_t;
    typedef std::map<TString, UInt_t> mapUInt_t;
    typedef std::map<TString, Float_t> mapFloat_t;
    typedef std::map<TString, Double_t> mapDouble_t;
    typedef std::map<TString, Long64_t> mapLong64_t;
    typedef std::map<TString, ULong64_t> mapULong64_t;
    typedef std::map<TString, Bool_t> mapBool_t;
    typedef std::map<TString, Short_t> mapShort_t;
    typedef std::map<TString, UShort_t> mapUShort_t;
    typedef std::map<TString, Char_t> mapChar_t;
    typedef std::map<TString, UChar_t> mapUChar_t;
    typedef std::map<TString, std::vector<int>* > mapvecint;
    typedef std::map<TString, std::vector<float>* > mapvecfloat;
    typedef std::map<TString, std::vector<double>* > mapvecdouble;
    typedef std::map<TString, std::vector<string>* > mapvecstring;
    typedef std::map<TString, std::vector<std::vector<int> >* > mapvecvecint;
    typedef std::map<TString, std::vector<std::vector<float> >* > mapvecvecfloat;
    typedef std::map<TString, std::vector<std::vector<double> >* > mapvecvecdouble;
    typedef std::map<TString, std::vector<std::vector<string> >* > mapvecvecstring;
    typedef std::map<TString, std::vector<PObject>* > mappobject;

    mapInt_t* Int_t__branches;
    mapUInt_t* UInt_t__branches;
    mapFloat_t* Float_t__branches;
    mapDouble_t* Double_t__branches;
    mapLong64_t* Long64_t__branches;
    mapULong64_t* ULong64_t__branches;
    mapBool_t* Bool_t__branches;
    mapShort_t* Short_t__branches;
    mapUShort_t* UShort_t__branches;
    mapChar_t* Char_t__branches;
    mapUChar_t* UChar_t__branches;
    mapvecint* vecint__branches;
    mapvecfloat* vecfloat__branches;
    mapvecdouble* vecdouble__branches;
    mapvecstring* vecstring__branches;
    mapvecvecint* vecvecint__branches;
    mapvecvecfloat* vecvecfloat__branches;
    mapvecvecdouble* vecvecdouble__branches;
    mapvecvecstring* vecvecstring__branches;

    Int_t verboselevel;
    enum verbosity {
      vDEBUG = 10,
      vINFO = 5,
      vMINIMAL = 1,
      vNONE = 0,
    };

    TTreeWrapper(TTree *tree);
    virtual ~TTreeWrapper();
    virtual Int_t    GetEntry(Long64_t entry);
    virtual Long64_t LoadTree(Long64_t entry);
    virtual void     Init(TTree *tree);
    virtual Bool_t   Notify();
    virtual void     Show(Long64_t entry = -1);

    virtual void SetVerboseLevel(Int_t level) { verboselevel = level; }

    virtual void SetBranches();
    virtual void SetBranch(TBranch* branch);
    virtual TString GetTypeName(TBranch* branch);

    void SetTLVs(std::vector<PObject>* tlvs, TString prefix, TString mode, TTreeFormula* cutformula=0);

    virtual void SetTLVsByPtEtaPhiE(std::vector<PObject>* tlvs, TString ptname, TString etaname, TString phiname, TString Ename, TString cut="1");
    virtual void SetTLVsByPtEtaPhiE(std::vector<PObject>* tlvs, TString prefix, TString cut="1");
    virtual Bool_t PObjectPassCut(TString cut, PObject tlv);
};

//___________________________________________________________________________________________
// implementations

//___________________________________________________________________________________________
TTreeWrapper::TTreeWrapper(TTree *tree) :
  fChain(0)
{
  Int_t__branches = 0;
  UInt_t__branches = 0;
  Float_t__branches = 0;
  Double_t__branches = 0;
  Long64_t__branches = 0;
  ULong64_t__branches = 0;
  Bool_t__branches = 0;
  Short_t__branches = 0;
  UShort_t__branches = 0;
  Char_t__branches = 0;
  UChar_t__branches = 0;
  vecint__branches = 0;
  vecfloat__branches = 0;
  vecdouble__branches = 0;
  vecstring__branches = 0;
  vecvecint__branches = 0;
  vecvecfloat__branches = 0;
  vecvecdouble__branches = 0;
  vecvecstring__branches = 0;
  verboselevel = 0;
  Init(tree);
}

//___________________________________________________________________________________________
TTreeWrapper::~TTreeWrapper()
{
  if (!fChain) return;
  delete fChain->GetCurrentFile();
  if (Int_t__branches) delete Int_t__branches;
  if (UInt_t__branches) delete UInt_t__branches;
  if (Float_t__branches) delete Float_t__branches;
  if (Double_t__branches) delete Double_t__branches;
  if (Long64_t__branches) delete Long64_t__branches;
  if (ULong64_t__branches) delete ULong64_t__branches;
  if (Bool_t__branches) delete Bool_t__branches;
  if (Short_t__branches) delete Short_t__branches;
  if (UShort_t__branches) delete UShort_t__branches;
  if (Char_t__branches) delete Char_t__branches;
  if (UChar_t__branches) delete UChar_t__branches;
  if (vecint__branches) { for (mapvecint::iterator it=vecint__branches->begin(); it!=vecint__branches->end(); ++it) { if (it->second) delete it->second; } delete vecint__branches; }
  if (vecfloat__branches) { for (mapvecfloat::iterator it=vecfloat__branches->begin(); it!=vecfloat__branches->end(); ++it) { if (it->second) delete it->second; } delete vecfloat__branches; }
  if (vecdouble__branches) { for (mapvecdouble::iterator it=vecdouble__branches->begin(); it!=vecdouble__branches->end(); ++it) { if (it->second) delete it->second; } delete vecdouble__branches; }
  if (vecstring__branches) { for (mapvecstring::iterator it=vecstring__branches->begin(); it!=vecstring__branches->end(); ++it) { if (it->second) delete it->second; } delete vecstring__branches; }
  if (vecvecint__branches) { for (mapvecvecint::iterator it=vecvecint__branches->begin(); it!=vecvecint__branches->end(); ++it) { if (it->second) delete it->second; } delete vecvecint__branches; }
  if (vecvecfloat__branches) { for (mapvecvecfloat::iterator it=vecvecfloat__branches->begin(); it!=vecvecfloat__branches->end(); ++it) { if (it->second) delete it->second; } delete vecvecfloat__branches; }
  if (vecvecdouble__branches) { for (mapvecvecdouble::iterator it=vecvecdouble__branches->begin(); it!=vecvecdouble__branches->end(); ++it) { if (it->second) delete it->second; } delete vecvecdouble__branches; }
  if (vecvecstring__branches) { for (mapvecvecstring::iterator it=vecvecstring__branches->begin(); it!=vecvecstring__branches->end(); ++it) { if (it->second) delete it->second; } delete vecvecstring__branches; }
}

//___________________________________________________________________________________________
Int_t TTreeWrapper::GetEntry(Long64_t entry)
{
  fChain->LoadTree(entry);
  return fChain->GetEntry(entry);
}

//___________________________________________________________________________________________
Long64_t TTreeWrapper::LoadTree(Long64_t entry)
{
  Long64_t centry = fChain->LoadTree(entry);
  if (centry < 0) return centry;
  if (fChain->GetTreeNumber() != fCurrent) {
    fCurrent = fChain->GetTreeNumber();
    Notify();
  }
  return centry;
}

//___________________________________________________________________________________________
void TTreeWrapper::Init(TTree *tree)
{
  if (!tree) return;
  fChain = tree;
  fCurrent = -1;
  fChain->SetMakeClass(1);
  SetBranches();
  Notify();
}

//___________________________________________________________________________________________
void TTreeWrapper::SetBranches()
{
  TObjArray* input_tree_branches = fChain->GetListOfBranches();
  for (Int_t ibr = 0; ibr < input_tree_branches->GetEntries(); ++ibr) {
    TBranch* br = (TBranch*) input_tree_branches->At(ibr);
    SetBranch(br);
  }
}

//___________________________________________________________________________________________
void TTreeWrapper::SetBranch(TBranch* br)
{
  TString name = br->GetName();
  TString type = GetTypeName(br);
  if (type.EqualTo("Int_t")) {
    if (!Int_t__branches)
      Int_t__branches = new mapInt_t();
    (*Int_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Int_t__branches)[name]);
  } else if (type.EqualTo("UInt_t")) {
    if (!UInt_t__branches)
      UInt_t__branches = new mapUInt_t();
    (*UInt_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*UInt_t__branches)[name]);
  } else if (type.EqualTo("Float_t")) {
    if (!Float_t__branches)
      Float_t__branches = new mapFloat_t();
    (*Float_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Float_t__branches)[name]);
  } else if (type.EqualTo("Double_t")) {
    if (!Double_t__branches)
      Double_t__branches = new mapDouble_t();
    (*Double_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Double_t__branches)[name]);
  } else if (type.EqualTo("Short_t")) {
    if (!Short_t__branches)
      Short_t__branches = new mapShort_t();
    (*Short_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Short_t__branches)[name]);
  } else if (type.EqualTo("UShort_t")) {
    if (!UShort_t__branches)
      UShort_t__branches = new mapUShort_t();
    (*UShort_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*UShort_t__branches)[name]);
  } else if (type.EqualTo("Long64_t")) {
    if (!Long64_t__branches)
      Long64_t__branches = new mapLong64_t();
    (*Long64_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Long64_t__branches)[name]);
  } else if (type.EqualTo("ULong64_t")) {
    if (!ULong64_t__branches)
      ULong64_t__branches = new mapULong64_t();
    (*ULong64_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*ULong64_t__branches)[name]);
  } else if (type.EqualTo("Bool_t")) {
    if (!Bool_t__branches)
      Bool_t__branches = new mapBool_t();
    (*Bool_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Bool_t__branches)[name]);
  } else if (type.EqualTo("Char_t")) {
    if (!Char_t__branches)
      Char_t__branches = new mapChar_t();
    (*Char_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*Char_t__branches)[name]);
  } else if (type.EqualTo("UChar_t")) {
    if (!UChar_t__branches)
      UChar_t__branches = new mapUChar_t();
    (*UChar_t__branches)[name] = 0;
    fChain->SetBranchAddress(name, &(*UChar_t__branches)[name]);
  } else if (type.EqualTo("vector<int>")) {
    if (!vecint__branches)
      vecint__branches = new mapvecint();
    (*vecint__branches)[name] = new std::vector<int>();
    (*vecint__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecint__branches)[name]);
  } else if (type.EqualTo("vector<float>")) {
    if (!vecfloat__branches)
      vecfloat__branches = new mapvecfloat();
    (*vecfloat__branches)[name] = new std::vector<float>();
    (*vecfloat__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecfloat__branches)[name]);
  } else if (type.EqualTo("vector<double>")) {
    if (!vecdouble__branches)
      vecdouble__branches = new mapvecdouble();
    (*vecdouble__branches)[name] = new std::vector<double>();
    (*vecdouble__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecdouble__branches)[name]);
  } else if (type.EqualTo("vector<string>")) {
    if (!vecstring__branches)
      vecstring__branches = new mapvecstring();
    (*vecstring__branches)[name] = new std::vector<string>();
    (*vecstring__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecstring__branches)[name]);
  } else if (type.EqualTo("vector<vector<int> >")) {
    if (!vecvecint__branches)
      vecvecint__branches = new mapvecvecint();
    (*vecvecint__branches)[name] = new std::vector<std::vector<int> >();
    (*vecvecint__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecvecint__branches)[name]);
  } else if (type.EqualTo("vector<vector<float> >")) {
    if (!vecvecfloat__branches)
      vecvecfloat__branches = new mapvecvecfloat();
    (*vecvecfloat__branches)[name] = new std::vector<std::vector<float> >();
    (*vecvecfloat__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecvecfloat__branches)[name]);
  } else if (type.EqualTo("vector<vector<double> >")) {
    if (!vecvecdouble__branches)
      vecvecdouble__branches = new mapvecvecdouble();
    (*vecvecdouble__branches)[name] = new std::vector<std::vector<double> >();
    (*vecvecdouble__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecvecdouble__branches)[name]);
  } else if (type.EqualTo("vector<vector<string> >")) {
    if (!vecvecstring__branches)
      vecvecstring__branches = new mapvecvecstring();
    (*vecvecstring__branches)[name] = new std::vector<std::vector<string> >();
    (*vecvecstring__branches)[name]->clear();
    fChain->SetBranchAddress(name, &(*vecvecstring__branches)[name]);
  }
  if (verboselevel >= vDEBUG) {
    std::cout << "SetBranchAddress - " << type;
    std::cout << " " << name << std::endl;
  }
}

//___________________________________________________________________________________________
TString TTreeWrapper::GetTypeName(TBranch* br)
{
  TObjArray* leaves = br->GetListOfLeaves();
  // assume only one leaf per branch as usual practice in ATLAS
  if (leaves->GetEntries() != 1) {
    std::cout << "ERROR - Number of leaves in the branch " << br->GetName() << " is not equal to one. This class is not suitable for this TTree" << std::endl;
    abort();
  }
  return TString(((TLeaf*) leaves->At(0))->GetTypeName());
}

//___________________________________________________________________________________________
Bool_t TTreeWrapper::Notify()
{
  return kTRUE;
}

//___________________________________________________________________________________________
void TTreeWrapper::Show(Long64_t entry)
{
  fChain->Show(entry);
}

//___________________________________________________________________________________________
void TTreeWrapper::SetTLVs(std::vector<PObject>* tlvs, TString prefix, TString mode, TTreeFormula* cutformula)
{
  // every time clear the container
  tlvs->clear();
  // load the relevant pointers
  std::vector<float>* v1 = 0;
  std::vector<float>* v2 = 0;
  std::vector<float>* v3 = 0;
  std::vector<float>* v4 = 0;
  if (mode.EqualTo("PtEtaPhiM")) {
    v1 = (*vecfloat__branches)[prefix+"_pt"];
    v2 = (*vecfloat__branches)[prefix+"_eta"];
    v3 = (*vecfloat__branches)[prefix+"_phi"];
    v4 = (*vecfloat__branches)[prefix+"_m"];
  } else if (mode.EqualTo("PtEtaPhiE")) {
    v1 = (*vecfloat__branches)[prefix+"_pt"];
    v2 = (*vecfloat__branches)[prefix+"_eta"];
    v3 = (*vecfloat__branches)[prefix+"_phi"];
    v4 = (*vecfloat__branches)[prefix+"_E"];
  } else if (mode.EqualTo("PxPyPzE")) {
    v1 = (*vecfloat__branches)[prefix+"_px"];
    v2 = (*vecfloat__branches)[prefix+"_py"];
    v3 = (*vecfloat__branches)[prefix+"_pz"];
    v4 = (*vecfloat__branches)[prefix+"_E"];
  } else {
    std::cout << "ERROR - provided mode not recognized to set TLVs : " << mode << std::endl;
    abort();
  }
  //std::vector<float>* v5 = 0;
  //if (prefix.EqualTo("jet_AntiKt4LCTopo"))
  //  v5 = (*vecfloat__branches)[prefix+"_jvtxf"];
  //else if (prefix.EqualTo("jet_AntiKt4Track"))
  //  v5 = (*vecfloat__branches)[prefix+"_OriginIndex"];
  // set up ttreeformula if the cut is not = "1"
  cutformula->GetNdata();
  for (Int_t ii = 0; ii < (Int_t) v1->size(); ++ii) {
    if (cutformula)
      if (!cutformula->EvalInstance(ii))
        continue;
    //if (prefix.EqualTo("jet_AntiKt4LCTopo")) {
    //  if (v1->at(ii) < 25000 || fabs(v2->at(ii)) > 2.5 || v5->at(ii) < 0.5)
    //    continue;
    //} else if (prefix.EqualTo("jet_AntiKt4Track")) {
    //  if (v1->at(ii) < 7000 || fabs(v2->at(ii)) > 2.5 || v5->at(ii) == 0)
    //    continue;
    //}
    PObject tlv;
    if (mode.EqualTo("PtEtaPhiM")) {
      tlv.SetPtEtaPhiM(v1->at(ii), v2->at(ii), v3->at(ii), v4->at(ii));
    } else if (mode.EqualTo("PtEtaPhiE")) {
      tlv.SetPtEtaPhiE(v1->at(ii), v2->at(ii), v3->at(ii), v4->at(ii));
    } else if (mode.EqualTo("PxPyPzE")) {
      tlv.SetPxPyPzE(v1->at(ii), v2->at(ii), v3->at(ii), v4->at(ii));
    } else {
      std::cout << "ERROR - provided mode not recognized to set TLVs : " << mode << std::endl;
      abort();
    }
    tlv.SetIndex(ii);
    tlv.SetPrefix(prefix);
    tlvs->push_back(tlv);
  }
  //delete cutformula;
}

//___________________________________________________________________________________________
void TTreeWrapper::SetTLVsByPtEtaPhiE(std::vector<PObject>* tlvs, TString ptname, TString etaname, TString phiname, TString Ename, TString cut)
{
  tlvs->clear();
  std::vector<float>* pt = (*vecfloat__branches)[ptname];
  std::vector<float>* eta = (*vecfloat__branches)[etaname];
  std::vector<float>* phi = (*vecfloat__branches)[phiname];
  std::vector<float>* E = (*vecfloat__branches)[Ename];
  TString prefix = ptname(0, ptname.Length()-3); // assumes of the format XXXX_pt if they don't agree this feature won't be used
  for (Int_t ii = 0; ii < (Int_t) pt->size(); ++ii) {
    PObject tlv;
    tlv.SetPtEtaPhiE(pt->at(ii), eta->at(ii), phi->at(ii), E->at(ii));
    tlv.SetIndex(ii);
    tlv.SetPrefix(prefix);
    if (!PObjectPassCut(cut, tlv))
      continue;
    tlvs->push_back(tlv);
  }
}

//___________________________________________________________________________________________
void TTreeWrapper::SetTLVsByPtEtaPhiE(std::vector<PObject>* tlvs, TString prefix, TString cut)
{
  SetTLVsByPtEtaPhiE(tlvs, prefix+"_pt", prefix+"_eta", prefix+"_phi", prefix+"_E", cut);
}

//___________________________________________________________________________________________
Bool_t TTreeWrapper::PObjectPassCut(TString cut, PObject tlv)
{
  // asterisk will indicate prefix
  return true;
}

//___________________________________________________________________________________________
void PTool::FilterTLVs(std::vector<PObject>* tlvs, float minpt, float etabound, bool lt, float maxpt)
{
  for (std::vector<PObject>::iterator it=tlvs->begin(); it!=tlvs->end(); ) {
    if (it->Pt() < minpt || it->Pt() >= maxpt) {
      it = tlvs->erase(it);
    } else {
      if (lt) {
        if (fabs(it->Eta()) > etabound)
          it = tlvs->erase(it);
        else
          ++it;
      } else {
        if (fabs(it->Eta()) <= etabound)
          it = tlvs->erase(it);
        else
          ++it;
      }
    }
  }
}

#endif

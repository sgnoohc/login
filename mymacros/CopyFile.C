//  .  may 27, 2013
// ..: philip.chang, university of illinois at urbana-champaign, physics dept.

//
// make a copy of a root file while keeping its content
// if there are TTree's one can apply a selection cuts
//

void CopyFile( const char* filename, const char* cut, const char* ofilename ) {
  TFile* file = new TFile(filename, "OPEN");
  TList* list = file->GetListOfKeys();
  TFile* ofile = new TFile(ofilename, "RECREATE");
  for (UInt_t i=0; i<list->GetEntries(); ++i) {
    TKey* key = (TKey*)list->At(i);
    TString keyname = key->GetName();
    TString keyclassname = key->GetClassName();
    std::cout << keyname << " " << keyclassname << std::endl;
    if (keyclassname.Contains("TH1"))
      (file->Get(keyname))->Write();
    else if (keyclassname.Contains("TTree")) {
      (((TTree*)file->Get(keyname))->CopyTree(cut))->Write(0,TObject::kOverwrite);
    }
  }
}
//eof

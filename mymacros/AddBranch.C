// Add Branch to a new file. Opens up the 'filename/treename' and then
// adds a branch with the 'expression' 'exprname' with 'type'
// e.g. Adding a new variable from a existing variable, 
//      isOS = lepID0*lepID1

void AddBranch( const char* filename,
                const char* treename, 
                const char* outputname,
                const char* outputtreename,
                const char* expression,
                const char* exprname,
                const char* type,
                const char* option = "RECREATE"
              )
{
  TFile* file = new TFile( filename, "OPEN" );
  TTree* tree = (TTree*) file->Get( treename );
  
  TFile* output = new TFile( outputname, option );
  TTree* clonetree = tree->CloneTree(0);

  clonetree->SetName( outputtreename );
  
  Int_t events = tree->GetEntries();

  tree->Draw( expression, "", "goff" );

  switch ( type )
  {
    case "D": Double_t var; Double_t* v1 = tree->GetV1(); break;
    case "I": Int_t    var; Double_t* v1 = tree->GetV1(); break;
    case "F": Float_t  var; Double_t* v1 = tree->GetV1(); break;
    case "d": Double_t var; Double_t* v1 = tree->GetV1(); break;
    case "i": int      var; Double_t* v1 = tree->GetV1(); break;
    case "f": float    var; Double_t* v1 = tree->GetV1(); break;
    case "D": double   var; Double_t* v1 = tree->GetV1(); break;
  }
  
  TString temp = exprname;
  TString temp1 = type;
  TString temp2 = temp + "/" + temp1;

  clonetree->Branch( temp, &var, temp2 );

  for( int i = 0; i < events; i++ )
  {
    tree->GetEntry(i);
    var = v1[i];
    clonetree->Fill();
  }
  if ( option == "UPDATE" )
    clonetree->Write("", TObject::kOverwrite);
  else
    clonetree->Write();
  output->Close();
}

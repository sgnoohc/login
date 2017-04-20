void DrawHist_old( const char* filename,
               const char* treename,
               const char* varname,
               const char* weight,
               const char* cut
             )
{

  TFile* file = new TFile( filename, "OPEN" );
  TTree* tree = (TTree*) file->Get( treename );

  string fcut(cut);

  ifstream ifile(cut);
  if (ifile) {
    getline(ifile,fcut);
    cout << fcut << endl;
  }
 
  TString temp1 = varname;
  temp1 = temp1 + ">>h1(1000,0,500000)";
  TString temp2 = weight;
  temp2 = temp2 +"*(" + TString(fcut)+")";

  TH1F* h1 = new TH1F("h1","h1",500,0,500000);

  Int_t entries = tree->GetEntries();
  Float_t wgt; tree->SetBranchAddress(weight, &wgt);
  Float_t var; tree->SetBranchAddress(varname, &var);

  for ( int i = 0; i < entries; i++ )
  {
    tree->GetEntry(i);
    h1->Fill(var,); 
    
  }

  //tree->Draw( temp1, temp2 );
  TCanvas* c1 = new TCanvas();
  //TH1F *h1 = (TH1F*)gDirectory->Get("h1");
  cout << "Integral : " << h1->Integral() << endl;
  cout << "Events : " << entries << endl;
  h1->Draw();
  c1->SaveAs("h1.pdf");                                                                                                                                                                                                                                                         

}

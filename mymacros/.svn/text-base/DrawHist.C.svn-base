void DrawHist( const char* filename,
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
  TString temp;
  if (ifile) {
    while (ifile.good())
    { 
      getline(ifile,fcut);
      temp += TString(fcut);
    }
  }
  
  //cout << temp << endl;
  TString temp1 = varname;
  temp1 = temp1 + ">>h1(1,-50000000000,500000000000)";
  TString temp2 = weight;
  temp2 = temp2 +"*(" + TString(temp)+")";
  cout << "RAW # : " <<tree->Draw( temp1, temp2 ) << endl;
  //TCanvas* c1 = new TCanvas();
  TH1F *h1 = (TH1F*)gDirectory->Get("h1");
  cout << "Integral : " << h1->Integral() << endl;
  h1->Draw();
  c1->SaveAs("h1.pdf");          

}

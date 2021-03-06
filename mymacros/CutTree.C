void CutTree( const char* filename,
              const char* treename,
              const char* cut,
              const char* outputfilename,
              const char* outputtreename,
              const char* option = "RECREATE" )
{

  TFile* file = new TFile( filename, "OPEN" );
  TTree* tree = (TTree*) file->Get( treename );

  TFile* newfile = new TFile( outputfilename, option );

  TTree* cuttree = tree->CopyTree( cut );

  cuttree->SetName(outputtreename);

  if ( option == "UPDATE" )
    cuttree->Write("", TObject::kOverwrite );
  else
    cuttree->Write();

  newfile->Close();
}

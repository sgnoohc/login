void ScanTree( const char* filename, const char* treename, const char* expr, const char* cut, int length = 10 )
{

  TFile* file = new TFile( filename, "OPEN" );
  TTree* tree = (TTree*) file->Get( treename );

  tree->SetScanField( length );

  tree->Scan( expr, cut );
} 

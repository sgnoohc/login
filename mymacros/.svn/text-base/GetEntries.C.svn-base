void GetEntries(const char* filename, const char* treename){

    TFile* file = new TFile(filename);

    TTree* tree = (TTree*) file->Get(treename);
   
    cout << "------=======------" << endl;
    cout << "    File: " << filename << endl;
    cout << "    Tree: " << treename << endl; 
    cout << " Entries: " << tree->GetEntries() << endl;
}

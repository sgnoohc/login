void ShowEvent(const char * a, const char* b , int i = 0) {

   TFile * file = new TFile(a);
   
   TTree* tree = (TTree*) file->Get(b);
   tree->Show(i);

}

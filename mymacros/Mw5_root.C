void Mw5_root(const char* file, const char* output, const char* treename, const char* samplename){

   ifstream in;
   in.open(file);

   Float_t IDNumber, EventNumber, me, error, ncalls, time, fail;
   Int_t   nlines = 0;

   TFile* f = new TFile(output,"RECREATE");
   TH1F *h_me     = new TH1F("h_me","me distribution", 100, -35,-7);
   TH1F *h_error  = new TH1F("h_error","error distribution", 100, -37,-9);
   TH1F *h_ncalls = new TH1F("h_ncalls","ncalls distribution",100,0,15000000);
   TH1F *h_time   = new TH1F("h_time","time distribution",100,0,600);
   TH1F *h_fail   = new TH1F("h_fail","fail status distribution",2,0,2);
   TNtuple* mw5tree = new TNtuple(treename,samplename,"IDNumber:EventNumber:me:error:ncalls:time:fail");

   while (1) {
      in >> IDNumber >> EventNumber >> me >> error >> ncalls >> time >> fail;
      if (!in.good()) break;
      if (nlines < 5) printf("IDNumber=%i \tEventNumber=%i \tme=%e \terror=%e \tncalls=%i \ttime=%f \tfail=%i\n",IDNumber,EventNumber,me,error,ncalls,time, fail);
      h_me->Fill(TMath::Log10(me));
      h_error->Fill(TMath::Log10(error));
      h_ncalls->Fill(ncalls);
      h_time->Fill(time);
      mw5tree->Fill(IDNumber,EventNumber,me,error,ncalls,time,fail);
      nlines++;
   }

   printf(" found %d events\n",nlines);

   in.close();

   f->Write();
}

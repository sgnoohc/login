void check_evn(TString filestring)
{

  TFile* file = new TFile(filestring);

  TTree*tt2j = (TTree*)file->Get("tt2j");
  TTree*vbf2j = (TTree*)file->Get("vbf2j");

  Float_t EventNumber_tt2j;  tt2j->SetBranchAddress("EventNumber",&EventNumber_tt2j);
  Float_t EventNumber_vbf2j; vbf2j->SetBranchAddress("EventNumber",&EventNumber_vbf2j);

  Float_t temp_tt2j;
  Float_t temp_vbf2j;

  for (unsigned i=0; i<tt2j->GetEntries(); ++i)
  {
    tt2j->GetEntry(i);
    vbf2j->GetEntry(i);

    if (temp_tt2j>EventNumber_tt2j)
    {
      std::cout << " " << i << " " <<  temp_tt2j<<" " << EventNumber_tt2j << std::endl;
    }
    if (temp_vbf2j>EventNumber_vbf2j)
    {
      std::cout <<  " " << i << " " << temp_vbf2j<<" " << EventNumber_vbf2j << std::endl;
    }

    temp_tt2j=EventNumber_tt2j;
    temp_vbf2j=EventNumber_vbf2j;
  }
}

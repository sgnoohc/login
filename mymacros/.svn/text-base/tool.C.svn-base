#ifndef MYTOOL
#define MYTOOL

#include "TChain.h"
#include "TFile.h"
#include "TH1.h"
#include "TH1F.h"
#include "TH2F.h"
#include "TROOT.h"
#include "TTree.h"

#include <iostream>
#include <fstream>

namespace RooTool {

  class List {
    private:
      TObjArray* data;
    public:
      List();
      ~List();
      void Add(const char* characters);
      TString At(int index);
  };
};

RooTool::List::List() {
  data = new TObjArray();
}

RooTool::List::~List() {
  if (data)
    delete data;
}

RooTool::List::Add(const char* characters) {
  data->Add(new TObjString(characters));
}

RooTool::List::At(int index) {
  return ((TObjString*) data->At(index))->GetString();
}

#endif

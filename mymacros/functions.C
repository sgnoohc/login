#ifndef MYFUNCTION
#define MYFUNCTION

#include "TChain.h"
#include "TFile.h"
#include "TH1.h"
#include "TROOT.h"
#include "TObjArray.h"

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

// short names
typedef std::vector<float> floatlist;
typedef std::vector<TString> list;
typedef std::vector<TString>::iterator listItr;

namespace tool {
  // function declarations
  void print(list _list);
  list readlines(TString file);
  list readfilelist(TString file);
  TChain* get_chain(TString name, TString txtfile);
  TH1* get_added_hist(TString histname, TString txtfile);
  TObjArray* get_hists(TString histname, TString txtfile);
  TH1* get_cloned_hist(TString histname, TString filename);
  void add_files(TChain* chain, TString txtfile);
  void add_files(TChain* chain, list lines);
  TString basename(TString filepath);
  list split(TString string, TString delim);
  list strip(list list_);
  list remove_comments(list lines);
  floatlist list_to_floatlist(list list_);
};

// ---------------------------------------------------------------------------------
//
//
//  Implementations
//
//
// ---------------------------------------------------------------------------------

list tool::readlines(TString file) {
  list filelist;
  filelist.clear();
  string line;
  ifstream myfile (file.Data());
  if (myfile.is_open()) {
    while (getline(myfile,line)) {
      TString lineString = line.c_str();
      filelist.push_back(TString(line.c_str()));
    }
    myfile.close();
  } else {
    std::cout << "Unable to open file" << std::endl;
  }
  return filelist;
}

list tool::readfilelist(TString file) {
  list filelist = readlines(file);
  filelist = strip(filelist);
  filelist = remove_comments(filelist);
  return filelist;
}

void tool::print(list _list) {
  for (listItr item = _list.begin(); item != _list.end(); ++item) {
    std::cout << *item << std::endl;
  }
}

TChain* tool::get_chain(TString name, TString txtfile) {
  TChain* chain = new TChain(name.Data());
  add_files(chain, txtfile);
  return chain;
}

void tool::add_files(TChain* chain, TString txtfile) {
  list lines = readlines(txtfile);
  add_files(chain, lines);
}

void tool::add_files(TChain* chain, list lines) {
  for (listItr line = lines.begin(); line != lines.end(); ++line) {
    TString filepath = (*line).Strip(TString::kLeading);
    if (filepath.BeginsWith("#"))
      continue;
    if (filepath.IsNull())
      continue;
    chain->Add(filepath);
  }
}

TH1* tool::get_added_hist(TString histname, TString txtfile) {
  list filelist = readfilelist(txtfile);
  TH1* rtrn_hist = 0;
  for (unsigned ifile = 0; ifile < filelist.size(); ++ifile) {
    TString filename = filelist.at(ifile);
    TH1* thishist = get_cloned_hist(histname, filename);
    if (ifile == 0)
      rtrn_hist = thishist;
    else
      rtrn_hist->Add(thishist);
  }
  return rtrn_hist;
}

TObjArray* tool::get_hists(TString histname, TString txtfile) {
  list filelist = readfilelist(txtfile);
  TObjArray* rtrn_hists = new TObjArray();
  for (unsigned ifile = 0; ifile < filelist.size(); ++ifile) {
    TString filename = filelist.at(ifile);
    TH1* thishist = get_cloned_hist(histname, filename);
    rtrn_hists->Add(thishist);
  }
  return rtrn_hists;
}

TH1* tool::get_cloned_hist(TString histname, TString filename) {
  TFile* file = TFile::Open(filename);
  TH1* hist = (TH1*) file->Get(histname);
  TH1* return_hist = (TH1*) hist->Clone();
  return_hist->SetDirectory(0);
  file->Close();
  return return_hist;
}

TString tool::basename(TString str) {
  return ((TObjString*) str.Tokenize("/")->Last())->GetString();
}

list tool::split(TString str, TString delim) {
  list retrnobj;
  retrnobj.clear();
  TObjArray* array = str.Tokenize(delim);
  for (Int_t item = 0; item < array->GetEntries(); ++item) {
    TString value = ((TObjString*) array->At(item))->GetString();
    retrnobj.push_back(value);
  }
  return retrnobj;
}

list tool::strip(list list_) {
  list rtrn;
  for (listItr item = list_.begin(); item != list_.end(); ++item) {
    TString strip = *item;
    strip = strip.Strip(TString::kLeading);
    strip = strip.Strip(TString::kTrailing);
    rtrn.push_back(strip);
  }
  return rtrn;
}

list tool::remove_comments(list lines) {
  list rtrn;
  for (listItr line = lines.begin(); line != lines.end(); ++line) {
    TString filepath = (*line).Strip(TString::kLeading);
    if (filepath.BeginsWith("#"))
      continue;
    if (filepath.IsNull())
      continue;
    rtrn.push_back(*line);
  }
  return rtrn;
}

floatlist tool::list_to_floatlist(list list_) {
  floatlist rtrn;
  for (listItr item = list_.begin(); item != list_.end(); ++item) {
    rtrn.push_back((*item).Atof());
  }
  return rtrn;
}

#endif

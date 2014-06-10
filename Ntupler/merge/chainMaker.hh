#ifndef CHAINMAKER_HH
#define CHAINMAKER_HH

#include <TROOT.h>
#include <TSystem.h>
#include <TFile.h>
#include <TTree.h>
#include <TChain.h>
#include <TClonesArray.h>
#include <vector>
#include <fstream>
#include <string>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <TString.h>
#include "ExRootAnalysis/ExRootTreeReader.h"
#include "classes/DelphesClasses.h"
#include "modules/Delphes.h"

void chainMaker(TChain *chain, TString run) {

  ifstream ifs;
  ifs.open(run+TString(".txt"));
  assert(ifs.is_open());
  string line;
  while (getline(ifs, line)) {
    if (line[0] == ' ') continue;
    else {
      stringstream ss(line);
      TString filename;
      ss >> filename;

      chain->Add(filename);
      
    }
  }
  ifs.close();
}

#endif

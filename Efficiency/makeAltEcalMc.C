//================================================================================================
//
// Select probes for electron efficiencies with Tag&Probe method
//
//  * outputs ROOT file with a TTree of probes
//
//________________________________________________________________________________________________
#if !defined(__CINT__) || defined(__MAKECINT__)
#include <TROOT.h>                        // access to gROOT, entry point to ROOT system
#include <TSystem.h>                      // interface to OS
#include <TFile.h>                        // file handle class
#include <TTree.h>                        // class to access ntuples
#include <TH1.h>
#include <TCanvas.h>
#include <TBenchmark.h>                   // class to track macro running statistics
#include <vector>                         // STL vector class
#include <iostream>                       // standard I/O
#include <iomanip>                        // functions to format standard I/O
#include "Math/LorentzVector.h"           // 4-vector class

// structure for output ntuple
#include "EffData.hh" 
#endif

typedef ROOT::Math::LorentzVector<ROOT::Math::PtEtaPhiM4D<double> > LorentzVector;

//=== MAIN MACRO ================================================================================================= 

void makeAltEcalMc(const TString infilename,           // input ntuple
		   const TString outputDir,            // output directory
		   const Int_t   effType,              // type of efficiency to compute
		   const Bool_t  doGenMatch = kFALSE,  // match to generator leptons
		   const Bool_t  doWeighted = kFALSE   // store events with weights
) {
  gBenchmark->Start("selectProbesEleEff");

  Bool_t shiftUp = 1;
  
  //--------------------------------------------------------------------------------------------------------------
  // Settings 
  //==============================================================================================================   
 
  const Double_t TAG_PT_CUT = 30;
  
  //--------------------------------------------------------------------------------------------------------------
  // Main analysis code 
  //==============================================================================================================  
  
  enum { eHLTEff, eSelEff, eGsfEff, eGsfSelEff };  // event category enum
  if(effType > eGsfSelEff) {
    cout << "Invalid effType option! Exiting..." << endl;
    return;
  }
  
  enum { eEleEle2HLT=1, eEleEle1HLT, eEleEleNoSel, eEleSC };
  
  Double_t nProbes = 0;
  
  //
  // Set up output ntuple
  //
  gSystem->mkdir(outputDir,kTRUE);
  TFile *outFile = new TFile(outputDir+TString("/up_probes.root"),"RECREATE"); 
  TTree *outTree = new TTree("Events","Events");
  EffData data;
  outTree->Branch("Events",&data.mass,"mass/F:pt:eta:phi:weight:q/I:npv/i:npu:pass:runNum:lumiSec:evtNum");

  //
  // Declare output ntuple variables
  //
  UInt_t  runNum, lumiSec, evtNum;
  UInt_t  matchGen;
  UInt_t  category;
  UInt_t  npv, npu;
  Float_t scale1fb;
  Float_t met, metPhi, sumEt, u1, u2;
  Float_t hovere2;
  Int_t   q1, q2;
  LorentzVector *dilep=0, *lep1=0, *lep2=0;
  LorentzVector *sc1=0, *sc2=0;
  
  // Read input file and get the TTrees
  cout << "Processing " << infilename << "..." << endl;
  TFile *infile = new TFile(infilename);	 assert(infile);
  TTree *intree = (TTree*)infile->Get("Events"); assert(intree);

  intree->SetBranchAddress("runNum",   &runNum);     // event run number
  intree->SetBranchAddress("lumiSec",  &lumiSec);    // event lumi section
  intree->SetBranchAddress("evtNum",   &evtNum);     // event number
  intree->SetBranchAddress("matchGen", &matchGen);   // event has both leptons matched to MC Z->ll
  intree->SetBranchAddress("category", &category);   // dilepton category
  intree->SetBranchAddress("npv",      &npv);	     // number of primary vertices
  intree->SetBranchAddress("npu",      &npu);	     // number of in-time PU events (MC)
  intree->SetBranchAddress("scale1fb", &scale1fb);   // event weight per 1/fb (MC)
  intree->SetBranchAddress("met",      &met);	     // MET
  intree->SetBranchAddress("metPhi",   &metPhi);     // phi(MET)
  intree->SetBranchAddress("sumEt",    &sumEt);	     // Sum ET
  intree->SetBranchAddress("u1",       &u1);	     // parallel component of recoil
  intree->SetBranchAddress("u2",       &u2);	     // perpendicular component of recoil
  intree->SetBranchAddress("q1",       &q1);	     // charge of tag lepton
  intree->SetBranchAddress("q2",       &q2);	     // charge of probe lepton
  intree->SetBranchAddress("dilep",    &dilep);      // dilepton 4-vector
  intree->SetBranchAddress("lep1",     &lep1);       // tag lepton 4-vector
  intree->SetBranchAddress("lep2",     &lep2);       // probe lepton 4-vector
  intree->SetBranchAddress("sc1",      &sc1);        // tag Supercluster 4-vector
  intree->SetBranchAddress("sc2",      &sc2);        // probe Supercluster 4-vector 
  intree->SetBranchAddress("hovere2",  &hovere2);    // HCAL energy over ECAL energy for probe

  TH1F *hScLow = new TH1F("hScLow", "hScLow", 80, 40, 200);
  TH1F *hScHigh = new TH1F("hScHigh", "hScHigh", 80, 40, 200);

  Int_t nLow = 0;
  Float_t nHigh = 0;

  for (UInt_t ientry=0; ientry<intree->GetEntries(); ientry++) {

    intree->GetEntry(ientry);
    if(sc1->Pt() < TAG_PT_CUT) continue;
    if(doGenMatch && !matchGen) continue;

    if( (category==eEleEleNoSel) || (category==eEleSC) ) {
      if ( hovere2 < 0.1 ) nLow++;
      else {
	if ( shiftUp == kFALSE) nHigh+=0.5;
	else if ( shiftUp == kTRUE) nHigh+=2;
    }
    }
  }  
  Float_t reScale = 1;
  if ( shiftUp == kFALSE) {
    //cout << "nLow " << nLow << " nHigh " << nHigh << " nTotal " << nLow+2*nHigh << endl;
    reScale = (nLow+nHigh)/Float_t(nLow);
  }
  else {
    //cout << "nLow " << nLow << " nHigh " << nHigh << " nTotal " << nLow+0.5*nHigh << endl;
    reScale = (nLow-0.5*nHigh)/Float_t(nLow);
  }
  //cout << "reScale " << reScale << endl;
  //cout << "expect " << nHigh << " high HoverE events, and " << nLow*reScale << " low HoverE events" << endl;
  //cout << "for a total of " << nHigh+nLow*reScale << " failing events" << endl;
  //
  // loop over events
  //
  for(UInt_t ientry=0; ientry<intree->GetEntries(); ientry++) {
    intree->GetEntry(ientry);
    
    if(sc1->Pt() < TAG_PT_CUT) continue;
    
    // check GEN match if necessary
    if(doGenMatch && !matchGen) continue;
    
    Bool_t  pass=kFALSE;
    
    if(effType==eHLTEff) {
      //
      // probe = electron passing selection
      // pass  = matched to HLT
      // * EleEle2HLT event means a passing probe, EleEle1HLT event means a failing probe
      //   all other categories do not satisfy probe requirements
      //    
      if     (category==eEleEle2HLT)  { pass=kTRUE; }
      else if(category==eEleEle1HLT)  { pass=kFALSE; }
      else if(category==eEleEleNoSel) { continue; }
      else                            { continue; }
    
    } else if(effType==eSelEff) {
      //
      // probe = electron
      // pass  = passing selection
      // * EleEle2HLT, EleEle1HLT event means a passing probe, EleEleNoSel event means a failing probe,
      //   EleSC event does not satisfy probe requirements
      //    
      if     (category==eEleEle2HLT)  { pass=kTRUE; }
      else if(category==eEleEle1HLT)  { pass=kTRUE; }
      else if(category==eEleEleNoSel) { pass=kFALSE; }
      else                            { continue; }
    
    } else if(effType==eGsfEff) {
      //
      // probe = supercluster
      // pass  = passing selection
      // * EleEle2HLT, EleEle1HLT, EleEleNoSel event means a passing probe,
      //   EleSC event means a failing probe
      //    
      if     (category==eEleEle2HLT)  { pass=kTRUE; }
      else if(category==eEleEle1HLT)  { pass=kTRUE; }
      else if(category==eEleEleNoSel) { pass=kTRUE; }
      else                            { pass=kFALSE; }  
    
    } else if(effType==eGsfSelEff) {
      //
      // probe = supercluster
      // pass  = passing selection
      // * EleEle2HLT, EleEle1HLT, EleEleNoSel event means a passing probe,
      //   EleSC event means a failing probe
      //    
      if     (category==eEleEle2HLT)  { pass=kTRUE; }
      else if(category==eEleEle1HLT)  { pass=kTRUE; }
      else if(category==eEleEleNoSel) { pass=kFALSE; }
      else                            { pass=kFALSE; }  
    }

    if ( (category == eEleSC) && (hovere2 > 0.1) ) {

      hScHigh->Fill(dilep->M());

      if (shiftUp == kFALSE) nProbes += doWeighted ? 0.5*scale1fb : 0.5;
      else if (shiftUp == kTRUE) nProbes += doWeighted ? 2*scale1fb : 2;

      // Fill tree
      data.mass	 = dilep->M();
      data.pt	 = sc2->Pt();
      data.eta	 = sc2->Eta();
      data.phi	 = (effType==eGsfEff || effType==eGsfSelEff) ? sc2->Phi() : lep2->Phi();
      if (shiftUp == kFALSE) data.weight  = doWeighted ? 0.5*scale1fb : 0.5;
      else if (shiftUp == kTRUE) data.weight  = doWeighted ? 2*scale1fb : 2;
      data.q	 = q2;
      data.npv	 = npv;
      data.npu	 = npu;
      data.pass	 = (pass) ? 1 : 0;
      data.runNum  = runNum;
      data.lumiSec = lumiSec;
      data.evtNum  = evtNum;
      outTree->Fill();
    }
    else if ( ( category == eEleSC) ) {
      
      hScLow->Fill(dilep->M());

      nProbes += doWeighted ? reScale*scale1fb : reScale;

      // Fill tree
      data.mass	 = dilep->M();
      data.pt	 = sc2->Pt();
      data.eta	 = sc2->Eta();
      data.phi	 = (effType==eGsfEff || effType==eGsfSelEff) ? sc2->Phi() : lep2->Phi();
      data.weight  = doWeighted ? reScale*scale1fb : reScale;
      data.q	 = q2;
      data.npv	 = npv;
      data.npu	 = npu;
      data.pass	 = (pass) ? 1 : 0;
      data.runNum  = runNum;
      data.lumiSec = lumiSec;
      data.evtNum  = evtNum;
      outTree->Fill();
    }

    else {

      nProbes += doWeighted ? scale1fb : 1;

      // Fill tree
      data.mass	 = dilep->M();
      data.pt	 = sc2->Pt();
      data.eta	 = sc2->Eta();
      data.phi	 = (effType==eGsfEff || effType==eGsfSelEff) ? sc2->Phi() : lep2->Phi();
      data.weight  = doWeighted ? scale1fb : 1;
      data.q	 = q2;
      data.npv	 = npv;
      data.npu	 = npu;
      data.pass	 = (pass) ? 1 : 0;
      data.runNum  = runNum;
      data.lumiSec = lumiSec;
      data.evtNum  = evtNum;
      outTree->Fill();
    }

    if(category==eEleEle2HLT) {
      if(sc2->Pt() < TAG_PT_CUT) continue;

      hScHigh->Fill(dilep->M());

      nProbes += doWeighted ? scale1fb : 1;

      data.mass    = dilep->M();
      data.pt      = sc1->Pt();
      data.eta     = sc1->Eta();
      data.phi     = (effType==eGsfEff) ? sc1->Phi() : lep1->Phi();
      data.weight  = doWeighted ? scale1fb : 1;
      data.q       = q1;
      data.npv     = npv;
      data.npu     = npu;
      data.pass    = 1;
      data.runNum  = runNum;
      data.lumiSec = lumiSec;
      data.evtNum  = evtNum;
      outTree->Fill();
    }

  }  

  //hScLow->Draw();
  //cout << hScHigh->GetMaximumBin() << endl;
  //cout << hScHigh->GetBinCenter(hScHigh->GetMaximumBin()) << endl;
  //cout << hScLow->GetMaximumBin() << endl;
  //cout << hScLow->GetBinCenter(hScLow->GetMaximumBin()) << endl;
  //delete infile;
  //infile=0, intree=0;	   

  //  TCanvas *c1 = new TCanvas("c1", "c1", 800, 600);

  //hSChigh->SetLineColor(2);
  //hSClow->Draw();
  //hSChigh->Draw("same");


  //--------------------------------------------------------------------------------------------------------------
  // Output
  //==============================================================================================================
   
  cout << "*" << endl;
  cout << "* SUMMARY" << endl;
  cout << "*--------------------------------------------------" << endl;
  cout << endl;

  cout << " Number of probes selected: " << nProbes << endl;
  
  outFile->Write();
  outFile->Close();
  delete outFile;
  
  cout << endl;
  cout << "  <> Output saved in " << outputDir << "/" << endl;    
  cout << endl;  
      
  gBenchmark->Show("selectProbesEleEff"); 
}

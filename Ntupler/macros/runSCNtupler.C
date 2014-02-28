#if !defined(__CINT__) || defined(__MAKECINT__)
#include <TROOT.h>
#include <TSystem.h>
#include "MitAna/DataUtil/interface/Debug.h"
#include "MitAna/Catalog/interface/Catalog.h"
#include "MitAna/TreeMod/interface/Analysis.h"
#include "MitEwk/Ntupler/interface/SCNtuplerMod.hh"
#include "MitEwk/Ntupler/interface/EWKAnaDefs.hh"
#endif

using namespace mithep;

/*
 *  useGen options:
 *  0: ignore GEN info
 *  1: H->WW/ZZ->2l2nu
 *  2: Z->ll
 *  3: W->lnu
 *  4: WW->2l2nu
 *  5: VZ->X+ll
 *  6: W+jets (flag for Wgamma)
 *  7: Z+jets (flag for Wgamma)
 */
   
//==================================================================================================
/*
 * Run on a BAMBU fileset
 *
 * Example usage:
 *   root -l -q -b runSCNtupler.C+\(\"0000\",\"noskim\",\"r12a-sel-v1\",\"t2mit/filefi/029\",\"/home/cmsprod/catalog/\",\"/scratch/klawhorn/EWKAna/bacon/\"\)
 *
 * Output file name has standard format: <dataset>_<fileset>_ntuple.root
 *
 */

void runSCNtupler(const char *fileset,
		  const char *skim,
		  const char *dataset,
		  const char *book,
		  const char *catalogDir,
		  const char *outputName,
		  int nevents)

{
  gDebugMask  = Debug::kAnalysis;  // debug message category
  gDebugLevel = 1;                 // higher level allows more messages to print

  // Set some useful flags

  Bool_t isData = kTRUE; // is Data? kTRUE or kFALSE

  Bool_t skipHLTFail = 1; // skip events that fail the HLT? 0 or 1 (generally 1 for data, 0 for MC)

  Int_t useGen = 0; // use generator info? (see above)

  Int_t fsrmode = 0; // fsr mode? related to what generator was used for MC (generally 0)

  cout << "isData: " << isData << " useGen: " << useGen << " fsrmode: " << fsrmode << " skipHLTFail: " << skipHLTFail << endl;

  // muon kinematics
  const Double_t muPtMin  = 20;
  const Double_t muPtMax  = 7000;
  const Double_t muEtaMin = -3;
  const Double_t muEtaMax =  3;

  // electron kinematics
  const Double_t eleEtMin  = 20;
  const Double_t eleEtMax  = 7000;
  const Double_t eleEtaMin = -3;
  const Double_t eleEtaMax =  3;
  
  // jet requirements
  const Double_t jetPtMin = 20;

  // SC requirements
  const Double_t scEtMin = 20;
      
  // good PV requirements
  const UInt_t   minNTracksFit = 0;
  const Double_t minNdof       = 4;
  const Double_t maxAbsZ       = 24;
  const Double_t maxRho        = 2;
  
  //
  // setup analysis object
  //
  Bool_t caching = kFALSE; // set this to true if you want to use file caching on t3
  Analysis *ana = new Analysis;
  ana->SetUseHLT(kTRUE);
  if(nevents>0) 
    ana->SetProcessNEvents(nevents);
  printf("\nRely on Catalog: %s\n",catalogDir);
  printf("  -> Book: %s  Dataset: %s  Fileset: %s <-\n\n",book,dataset,fileset);
  Catalog *c = new Catalog(catalogDir);
  TString skimdataset = TString(dataset)+TString("/")+TString(skim);
  Dataset *d = NULL;
  TString bookstr = book;
  if (TString(skim).CompareTo("noskim") == 0)
    d = c->FindDataset(bookstr,dataset,fileset,caching);
  else
    d = c->FindDataset(bookstr,skimdataset.Data(),fileset,caching);
  ana->AddDataset(d);
    
  //
  // setup ntupler module
  //
  SCNtuplerMod *mymod = new SCNtuplerMod;
  mymod->SetOutputName(outputName);          // output ntuple file name
  mymod->SetIsData(isData);              // toggle data specific or MC specific procedures
  mymod->SetUseGen(useGen);              // use generator info
  mymod->SetSkipIfHLTFail(skipHLTFail);  // skip to next event if no HLT accept
  mymod->SetFSRMode(fsrmode);
  mymod->SetMuPtMin(muPtMin);
  mymod->SetMuPtMax(muPtMax);
  mymod->SetMuEtaMin(muEtaMin);
  mymod->SetMuEtaMax(muEtaMax);
  mymod->SetEleEtMin(eleEtMin);
  mymod->SetEleEtMax(eleEtMax);
  mymod->SetEleEtaMin(eleEtaMin);
  mymod->SetEleEtaMax(eleEtaMax);
  mymod->SetJetPtMin(jetPtMin);
  mymod->SetSCEtMin(scEtMin);
  mymod->SetMinNTracksFit(minNTracksFit);
  mymod->SetMinNdof(minNdof);
  mymod->SetMaxAbsZ(maxAbsZ);
  mymod->SetMaxRho(maxRho);

  // Jet corrections
  char* PATH = getenv("CMSSW_BASE"); assert(PATH);
  TString path(TString::Format("%s/src/MitPhysics/data/", PATH));

  mymod->AddJetCorr(path + "Summer13_V1_MC_L1FastJet_AK5PF.txt");
  mymod->AddJetCorr(path + "Summer13_V1_MC_L2Relative_AK5PF.txt");
  mymod->AddJetCorr(path + "Summer13_V1_MC_L3Absolute_AK5PF.txt");
  if(isData) {
    mymod->AddJetCorr(path + "Summer13_V1_DATA_L1FastJet_AK5PF.txt");
    mymod->AddJetCorr(path + "Summer13_V1_DATA_L2Relative_AK5PF.txt");
    mymod->AddJetCorr(path + "Summer13_V1_DATA_L3Absolute_AK5PF.txt");
    mymod->AddJetCorr(path + "Summer13_V1_DATA_L2L3Residual_AK5PF.txt");
  }
  //
  // SingleMu
  // these are examples of triggers with trigger objects

  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v11", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoFiltered10", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v12", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoFiltered10", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v13", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v14", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v15", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);

  //
  // SingleElectron
  // these are examples of triggers with trigger objects

  mymod->AddTrigger("HLT_Ele27_WP80_v8", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v9", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v10", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v11", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);

  //
  // DoubleMu
  // and these are just triggers -- no object matching

  mymod->AddTrigger("HLT_Mu17_TkMu8_v9", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v10", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v11", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v12", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v13", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v14", kHLT_Mu17_TkMu8);

  //
  // DoubleEle
  // and these are just triggers -- no object matching

  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v15", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v16", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v17", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v18", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v19", kHLT_Ele17_CaloIdL_CaloIsoVL);

  mymod->SetPrintHLT(kFALSE); // print HLT table at start of analysis? good for debugging.. also lots of spam
  
  ana->AddSuperModule(mymod); 
    
  //
  // run analysis after successful initialisation
  //
  ana->Run(!gROOT->IsBatch());
}

//==================================================================================================
/*
 * Run on a single BAMBU file (mainly for testing purposes)
 *
 */
//==================================================================================================
void runSCNtupler(
		  const char *file   = "root://xrootd.cmsaf.mit.edu//store/user/paus/filefi/029/r12a-sel-j22-v1/00176847-0073-E211-9FFE-0030487DE7C5.root",
		  const char *output = "/scratch/klawhorn/test_scntuple.root",
		  Bool_t isData      = kTRUE,
		  Int_t  useGen      = 0,
		  Int_t  fsrmode     = 0,
		  Int_t  nevents     = -1,
		  Bool_t skipHLTFail = kFALSE
		  )
{
  gDebugMask  = Debug::kAnalysis;  // debug message category
  gDebugLevel = 0xFFFFFFFF;                 // higher level allows more messages to print

  // muon kinematics
  const Double_t muPtMin  = 0;
  const Double_t muPtMax  = 7000;
  const Double_t muEtaMin = -3;
  const Double_t muEtaMax =  3;

  // electron kinematics
  const Double_t eleEtMin  = 9;
  const Double_t eleEtMax  = 7000;
  const Double_t eleEtaMin = -3;
  const Double_t eleEtaMax =  3;
  
  // jet requirements
  const Double_t jetPtMin = 10;

  // SC requirements
  const Double_t scEtMin = 9;
      
  // good PV requirements
  const UInt_t   minNTracksFit = 0;
  const Double_t minNdof       = 4;
  const Double_t maxAbsZ       = 24;
  const Double_t maxRho        = 2;
  
  //
  // setup analysis object
  //
  Analysis *ana = new Analysis;
  ana->SetUseHLT(kTRUE);
  if(nevents>0) 
    ana->SetProcessNEvents(nevents);
  ana->AddFile(file);
    
  //
  // setup ntupler module
  //
  SCNtuplerMod *mymod = new SCNtuplerMod;
  mymod->SetOutputName(output);          // output ntuple file name
  mymod->SetIsData(isData);              // toggle data specific or MC specific procedures
  mymod->SetUseGen(useGen);              // use generator info
  mymod->SetSkipIfHLTFail(skipHLTFail);  // skip to next event if no HLT accept
  mymod->SetFSRMode(fsrmode);
  mymod->SetMuPtMin(muPtMin);
  mymod->SetMuPtMax(muPtMax);
  mymod->SetMuEtaMin(muEtaMin);
  mymod->SetMuEtaMax(muEtaMax);
  mymod->SetEleEtMin(eleEtMin);
  mymod->SetEleEtMax(eleEtMax);
  mymod->SetEleEtaMin(eleEtaMin);
  mymod->SetEleEtaMax(eleEtaMax);
  mymod->SetJetPtMin(jetPtMin);
  mymod->SetSCEtMin(scEtMin);
  mymod->SetMinNTracksFit(minNTracksFit);
  mymod->SetMinNdof(minNdof);
  mymod->SetMaxAbsZ(maxAbsZ);
  mymod->SetMaxRho(maxRho);

  // Jet corrections
  char* PATH = getenv("CMSSW_BASE"); assert(PATH);
  TString path(TString::Format("%s/src/MitPhysics/data/", PATH));

  mymod->AddJetCorr(path+"Summer13_V1_MC_L1FastJet_AK5PF.txt");
  mymod->AddJetCorr(path+"Summer13_V1_MC_L2Relative_AK5PF.txt");
  mymod->AddJetCorr(path+"Summer13_V1_MC_L3Absolute_AK5PF.txt");
  if(isData) {
    mymod->AddJetCorr(path+"Summer13_V1_DATA_L1FastJet_AK5PF.txt");
    mymod->AddJetCorr(path+"Summer13_V1_DATA_L2Relative_AK5PF.txt");
    mymod->AddJetCorr(path+"Summer13_V1_DATA_L3Absolute_AK5PF.txt");
    mymod->AddJetCorr(path+"Summer13_V1_DATA_L2L3Residual_AK5PF.txt");
  }
  
  //
  // SingleMu
  //
  
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v11", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f40QL3crIsoFiltered10", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v12", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f40QL3crIsoFiltered10", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v13", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v14", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);
  mymod->AddTrigger("HLT_IsoMu24_eta2p1_v15", kHLT_IsoMu24_eta2p1, "hltL3crIsoL1sMu16Eta2p1L1f0L2f16QL3f24QL3crIsoRhoFiltered0p15", kHLT_IsoMu24_eta2p1Obj);
  
  //
  // SingleElectron
  //

  mymod->AddTrigger("HLT_Ele27_WP80_v8", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v9", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v10", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);
  mymod->AddTrigger("HLT_Ele27_WP80_v11", kHLT_Ele27_WP80, "hltEle27WP80TrackIsoFilter", kHLT_Ele27_WP80Obj);

  //
  // DoubleMu
  //

  mymod->AddTrigger("HLT_Mu17_TkMu8_v9", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v10", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v11", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v12", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v13", kHLT_Mu17_TkMu8);
  mymod->AddTrigger("HLT_Mu17_TkMu8_v14", kHLT_Mu17_TkMu8);

  //
  // DoubleEle 
  //

  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v15", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v16", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v17", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v18", kHLT_Ele17_CaloIdL_CaloIsoVL);
  mymod->AddTrigger("HLT_Ele17_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_Ele8_CaloIdT_CaloIsoVL_TrkIdVL_TrkIsoVL_v19", kHLT_Ele17_CaloIdL_CaloIsoVL);
  
  mymod->SetPrintHLT(kFALSE); // print HLT table at start of analysis?
  
  ana->AddSuperModule(mymod); 
  
  //
  // run analysis after successful initialisation
  //
  ana->Run(!gROOT->IsBatch());

}


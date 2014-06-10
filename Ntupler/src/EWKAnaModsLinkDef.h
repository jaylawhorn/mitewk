#ifndef EWKANA_NTUPLER_LINKDEF_H
#define EWKANA_NTUPLER_LINKDEF_H
<<<<<<< HEAD
#include "EWKAna/Ntupler/interface/BambuGenDumperMod.hh"
#include "EWKAna/Ntupler/interface/NtuplerMod.hh"
#include "EWKAna/Ntupler/interface/SCNtuplerMod.hh"
#include "EWKAna/Ntupler/interface/TEventInfo.hh"
#include "EWKAna/Ntupler/interface/TGenInfo.hh"
#include "EWKAna/Ntupler/interface/TMuon.hh"
#include "EWKAna/Ntupler/interface/TElectron.hh"
#include "EWKAna/Ntupler/interface/TJet.hh"
#include "EWKAna/Ntupler/interface/TPhoton.hh"
#include "EWKAna/Ntupler/interface/TVertex.hh"
=======
#include "MitEwk/Ntupler/interface/BambuGenDumperMod.hh"
#include "MitEwk/Ntupler/interface/NtuplerMod.hh"
#include "MitEwk/Ntupler/interface/SCNtuplerMod.hh"
#include "MitEwk/Ntupler/interface/TEventInfo.hh"
#include "MitEwk/Ntupler/interface/TGenInfo.hh"
#include "MitEwk/Ntupler/interface/TMuon.hh"
#include "MitEwk/Ntupler/interface/TElectron.hh"
#include "MitEwk/Ntupler/interface/TJet.hh"
#include "MitEwk/Ntupler/interface/TPhoton.hh"
#include "MitEwk/Ntupler/interface/TVertex.hh"
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
#endif

#ifdef __CINT__
#pragma link off all globals;
#pragma link off all classes;
#pragma link off all functions;
#pragma link C++ nestedclass;
#pragma link C++ nestedtypedef;
#pragma link C++ namespace mithep;

#pragma link C++ class mithep::BambuGenDumperMod+;
#pragma link C++ class mithep::NtuplerMod+;
#pragma link C++ class mithep::SCNtuplerMod+;
#pragma link C++ class mithep::TEventInfo+;
#pragma link C++ class mithep::TGenInfo+;
#pragma link C++ class mithep::TMuon+;
#pragma link C++ class mithep::TElectron+;
<<<<<<< HEAD
//#pragma link C++ class mithep::TPFTau+;
//#pragma link C++ class mithep::TPFCandidate+;
=======
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
#pragma link C++ class mithep::TJet+;
#pragma link C++ class mithep::TPhoton+;
#pragma link C++ class mithep::TVertex+;
#endif

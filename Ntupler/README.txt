MitEwk/Ntupler/README.txt - Jay Lawhorn 8/6/13

* Introduction
* Submit a job
* Trigger/trigger object modification
* Mva MET addition details -- more in depth modification

------| INTRODUCTION |------

* This folder is setup to produce the Ntuples from 029 and 031 BAMBU files Jay used in Summer 2013, NOT the 028 BAMBU files Kevin originally used.

* For just trying to use this tool without changes, you should start with macros/ and condor/. 

* This README will first walk you through submitting a job to condor using this setup and then point out the sections of the module that will need updating for use with new datasets. 

------| SUBMIT A JOB |------

Prerequisites:
* The code is setup to submit to the T3_MIT cluster, so you need access to that.
* You will need CERN.CH certificates as well as GRID proxy certificates.
* The code worked in CMSSW 5.3.10 patch 1 with MIT 031. You'll need some form of CMSSW and the MIT software.

Basic Info:
* You want to store super cluster info, so base macro is macros/runSCNtupler.C
* condor/run.sh is a bash script wrapper that runs that macro locally
* condor/submit.sh is a bash script that handles the actual condor submission of jobs consisting of run.sh

Running:
* in macros/runSCNtupler.c there are 4 variables to manually set for each submission:

    isData: set kTRUE for data, kFALSE for MC

    skipHLTFail: set 0 for MC always (accurate total MC event counts are needed later). 
		 setting 1 for data will provide reasonable output file size reduction

    useGen: set 0 for data or everything will crash. the full list of options is given at the top of the file, but in this case, just
	    set 2 for Zll MC, set 3 for Wlnu MC, and set 0 for all the other background MC

    fsrmode: set 0 (has to do with the generator used for MC production -- see src/SCNtuplerMod.cc for more info

* can use macros/runSCNtupler.C totally interactively with:

    root -l -q -b runSCNtupler.C+\(\"0000\",\"noskim\",\"r12a-sel-v1\",\"t2mit/filefi/029\",\"/home/cmsprod/catalog/\",\"output.root\"\)
				    fileset  skim       dataset         book                 catalog_dir                output_name

* can use condor/run.sh interactively with:

    source run.sh runSCNtupler.C /home/cmsprod/catalog t2mit/filefi/029 r12a-sel-j22-v1 noskim 0000 output_name output_dir 0 
		  run_macro      catalog_dir           book             dataset         skim   fileset                     runTypeId?

* (RECOMMENDED) run:

    cmsenv

    kinit -a -f (username)@CERN.CH

    voms-proxy-init -voms cms

    source submit.sh runSCNtupler.C /home/cmsprod/catalog t2mit/filefi/029 r12a-sel-j22-v1 noskim output_name output_dir 0            0 
                     run_macro      catalog_dir           book             dataset         skim                          runTypeIndex noStage


------| TRIGGER MODIFICATION |------

* interface/EWKAnaDefs.hh:

     in enum ETriggerBit, assign a bit to each of your triggers (but not trigger versions)

     in enum ETriggerObjBit, assign a bit to each of your trigger objects (but not trigger versions)

* macros/runSCNtupler.C:

     adjust kinematic cuts as needed (keep then lower than your trigger threshold, but higher cuts will reduce your output file size)

     update jet correction files starting line 126

     update triggers starting line 142 - 

         want one line per trigger VERSION, and the syntax is 
	 AddTrigger("trigger_name", ETriggerBit_name, "trigger_object_name", ETriggerObjBit_name)

	 if you don't care about trigger objects, use 
	 AddTrigger("trigger_name", ETriggerBit_name)


------| EVEN FURTHER MODIFICATION -- MVAMET + TAU ADDITION |------

When I ran on 2012A data, one of the things I looked at was a different definition of MET: MVA MET. 
(Versus PF MET.) Adding things to the ntuples is a bit non-obvious, but the MVA MET additions illustrate
three things: reading in information about taus, using the MVA MET module, and adding branches to the output ntuples.

The most important thing to know is that if you make ANY changes in the src/ or interface/ folders, you'll need to 
run "scram b" before anything will work.

So first things first, reading in taus.

* interface/SCNtuplerMod.hh:

    line 156: TString fHPSTauName;
    Declare a string to hold the name of the Tau collection in BAMBU.

    line 175: const PFTauCol *fPFTaus; 
    Declare collection to hold tau information.

    line 200: Double_t fPFTauEtMin;
              Double_t fPFTauEtaMax;
    Declare eta and pt thresholds for taus. (Not 100% if necessary, didn't try w/out it.)

* src/SCNtuplerMod.cc:

    line 46:  fHPSTauName ("HPSTaus"),
    Set the string that contains the name of the Tau collection in BAMBU.

    line 63:  fPFTaus (0),
    Set collection to hold tau information to 0. 

    line 89:  fPFTauEtMin (15),
	      fPFTauEtaMax (3),
    Set eta and pt thresholds for taus.

    line 147: ReqBranch(fHPSTauName, fPFTaus);
    Request BAMBU branch for taus.

    line 293: LoadBranch(fHPSTauName);
    Load BAMBU branch for taus.

Okay, now that the taus are all set, time to set up and use mvaMET module.

* interface/SCNtuplerMod.hh:

    line 15:  #include "MitPhysics/Utils/interface/MVAMet.h"
    Include the module we're trying to use.

    line 237: MVAMet *fMVAMet;
    Declare an mvaMET object.

* src/SCNtuplerMod.cc:

    line 204: fMVAMet = new MVAMet();
    Initialize mvaMET object. Further initialization with TMVA, etc, information happens on lines 205-211, 
    so look at that too if you're interested in mvaMET in particular.

    line 239: delete fMVAMet;
    Don't be a memory hog.

    line 501: Met mvaMet = fMVAMet->GetMet(fMuons,fElectrons,fPFTaus,fPFCandidates,fPFJets,0,fPrimVerts,fPFMet,fJetCorrector,fPUEnergyDensity);
    Calculate mvaMET for event based on all the arrays it gets passed.

Then for the last step, adding something to the output ntuple.

* interface/TEventInfo.hh

    line 22:  Float_t mvaMET, mvaMETphi;
    TEventInfo is a class, we're declaring the two new attributes.

* src/SCNtuplerMod.cc

    line 542: fEventInfo.mvaMET       = mvaMet.Pt();
              fEventInfo.mvaMETphi    = mvaMet.Phi();
    Setting values for the new attributes we just declared.
#! /bin/bash

HFLUMI=0.018729
PIXLUMI=0.018479
LUMI=${HFLUMI}

#const TString  outputDir,   // output directory
#const Double_t lumi,        // integrated luminosity (/fb)
#const Bool_t recoil,        // 1 = do recoil corrections, 0 = no recoil corrections
#const Bool_t mvaMet,        // 1 = fit with mva met, 0 = fit with pf met
#const Double_t nsigma=0     // vary MET corrections by n-sigmas (nsigma=0 means nominal correction)


SEL_LUMI=0.883371
SMU_LUMI=0.889360

root -l -q fitWm.C+\(\"Wmunu/PF_NoRecoil\",${SMU_LUMI},0,0,0\)
root -l -q fitWm.C+\(\"Wmunu/PF_Recoil\",${SMU_LUMI},1,0,0\)
root -l -q fitWm.C+\(\"Wmunu/MVA_NoRecoil\",${SMU_LUMI},0,1,0\)
root -l -q fitWm.C+\(\"Wmunu/MVA_Recoil\",${SMU_LUMI},1,1,0\)

#root -l -q fitWe.C+\(\"Wenu/PF_NoRecoil\",${SMU_LUMI},0,0,0\)
#root -l -q fitWe.C+\(\"Wenu/PF_Recoil\",${SMU_LUMI},1,0,0\)
#root -l -q fitWe.C+\(\"Wenu/MVA_NoRecoil\",${SMU_LUMI},0,1,0\)
#root -l -q fitWe.C+\(\"Wenu/MVA_Recoil\",${SMU_LUMI},1,1,0\)


root -l -q plotZmm.C+\(\"Zplots/Zmumu\",${SMU_LUMI}\)
root -l -q plotZee.C+\(\"Zplots/Zee\",${SMU_LUMI}\)

#root -l -q fitWm.C+\(\"Wmunu/PF_p1sig\",${SMU_LUMI},1,0,1\)
#root -l -q fitWm.C+\(\"Wmunu/PF_m1sig\",${SMU_LUMI},1,0,-1\)
#root -l -q fitWe.C+\(\"Wenu/PF_p1sig\",${SEL_LUMI},1,0,1\)
#root -l -q fitWe.C+\(\"Wenu/PF_m1sig\",${SEL_LUMI},1,0,-1\)


rm *.so *.d

#! /bin/bash

NTUPDIR=/scratch/klawhorn/EWKAnaR12a/Selection
#HFLUMI=0.018729
#PIXLUMI=0.018479
#LUMI=${HFLUMI}

SEL_LUMI=0.805396
SMU_LUMI=0.889360

#selectZee(const TString conf,        // input file                                                                                    
#               const TString outputDir,   // output directory
#              const Bool_t  doScaleCorr  // apply energy scale corrections?   

#root -l -q selectZmm.C+\(\"zmm.conf\",\"${NTUPDIR}/Zmumu\"\)
#root -l -q selectWm.C+\(\"wm.conf\",\"${NTUPDIR}/Wmunu\"\) 
#root -l -q selectAntiWm.C+\(\"wm.conf\",\"${NTUPDIR}/AntiWmunu\"\)
#root -l -q plotZmm.C+\(\"zmm.conf\",\"${NTUPDIR}/Zmumu/ntuples\",\"Zmumu\",${SMU_LUMI}\)
#root -l -q plotWm.C+\(\"wm.conf\",\"${NTUPDIR}/Wmunu/ntuples\",\"Wmunu\",${SMU_LUMI}\)

root -l -q selectAntiZmm.C+\(\"zmm.conf\",\"${NTUPDIR}/AntiZmumu\"\)

#root -l -q selectZee.C+\(\"zee.conf\",\"${NTUPDIR}/Zee\",1\)
#root -l -q selectWe.C+\(\"we.conf\",\"${NTUPDIR}/Wenu\",0\)
#root -l -q selectWe.C+\(\"we.conf\",\"${NTUPDIR}/Wenu\",1\)
#root -l -q selectAntiWe.C+\(\"we.conf\",\"${NTUPDIR}/AntiWenu\",1\)
#root -l -q plotZee.C+\(\"zee.conf\",\"${NTUPDIR}/Zee/ntuples\",\"Zee\",${SEL_LUMI}\)
#root -l -q plotWe.C+\(\"we.conf\",\"${NTUPDIR}/Wenu/ntuples\",\"Wenu\",${SEL_LUMI}\)

rm *.so *.d

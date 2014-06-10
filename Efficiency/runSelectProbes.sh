#! /bin/bash

INPUTDIR=/scratch/klawhorn/EWKAnaR12a/Selection
OUTPUTDIR=/scratch/klawhorn/EWKAnaR12a/Efficiency

#
# Select probes for muon efficiencies
#
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuHLTEff\",0,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuSelEff\",1,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuTrkEff\",2,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuStaEff\",3,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuStaEff_iso\",4,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuPOGIDEff\",5,1\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",\"${OUTPUTDIR}/Zmm_MuPOGIsoEff\",6,1\)

#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_MuHLTEff\",0,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_MuSelEff\",1,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_MuTrkEff\",2,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_MuStaEff\",3,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",\"R12a_MuStaEff_iso\",4,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_m23_select.root\",\"${OUTPUTDIR}/May23_MuPOGIDEff\",5,0\)
#root -l -n -q selectProbesMuEff.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_m23_select.root\",\"${OUTPUTDIR}/May23_MuPOGIsoEff\",6,0\)

#
# Select probes for electron efficiencies
#
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",\"${OUTPUTDIR}/Zee_EleHLTEff\",0,1\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",\"${OUTPUTDIR}/Zee_EleSelEff\",1,1\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",\"${OUTPUTDIR}/Zee_EleGsfEff\",2,1\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",\"Zee_EleGsfSelEff\",3,1\)

#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_pr_select.root\",\"${OUTPUTDIR}/PR_EleHLTEff\",0,0\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_pr_select.root\",\"${OUTPUTDIR}/PR_EleSelEff\",1,0\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_pr_select.root\",\"${OUTPUTDIR}/PR_EleGsfEff\",2,0\)

#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_EleHLTEff\",0,0\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_EleSelEff\",1,0\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_EleGsfEff\",2,0\)
#root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",\"${OUTPUTDIR}/R12a_EleGsfSelEff\",3,0\)
root -l -n -q selectProbesEleEff.C+\(\"${INPUTDIR}/Zee/ntuples/qcd_select.root\",\"qcd\",3,0\)

#root -l makeAltEcalMc.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",\"/scratch/klawhorn/EffSysStore/test\",3,1\)

#root -l makeMuStaBkg.C+\(\"${INPUTDIR}/AntiZmumu/ntuples/data_select.root\",\"muStaBkg\",4,0\)

rm *.so *.d

#--------------------------------------------------------------
#  Example script to run efficiency calculations
#==============================================================

# directory of probes ntuples
NTUPLEDIR=/scratch/klawhorn/EWKAnaR12a/Efficiency

#
# Electron efficiencies
#
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff/analysis\",\"png\",0,0,0\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"elgsfsel.bins\",2,2,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff/analysis\",\"png\",0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)

#
# Electron (+) efficiencies
#
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff_pos/analysis\",\"png\",0,0,1\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff_pos/analysis\",\"png\",0,0,1\)
root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff_pos/analysis\",\"png\",0,0,1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)

#
# Electron (-) efficiencies
#
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff_neg/analysis\",\"png\",0,0,-1\)
root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff_neg/analysis\",\"png\",0,0,-1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)

rm *.so *.d
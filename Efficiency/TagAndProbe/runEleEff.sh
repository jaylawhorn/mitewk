#--------------------------------------------------------------
#  Example script to run efficiency calculations
#==============================================================

# directory of probes ntuples
<<<<<<< HEAD
NTUPLEDIR=/scratch/klawhorn/EWKAnaR12a/Efficiency
=======
NTUPLEDIR=/scratch/klawhorn/EWKAnaStore/8TeV/Efficiency
#OUTPUTDIR=/scratch/klawhorn/EWKAnaStore/8TeV/EfficiencyResults
OUTPUTDIR="."
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

#
# Electron efficiencies
#
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff/analysis\",\"png\",0,0,0\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"elgsfsel.bins\",2,2,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff/analysis\",\"png\",0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"${OUTPUTDIR}/Zee_EleHLTEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"${OUTPUTDIR}/May23_EleHLTEff/analysis\",\"png\",0,0,0\)
##root -l -q plotEff.C+\(\"elhlt_highpt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"May23_EleHLTEff/190949\",\"png\",0,0,0,\"\",190949,190949\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/Zee_EleGsfSelEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/May23_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/May23_EleGsfSelEff/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

#
# Electron (+) efficiencies
#
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff_pos/analysis\",\"png\",0,0,1\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff_pos/analysis\",\"png\",0,0,1\)
root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff_pos/analysis\",\"png\",0,0,1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"${OUTPUTDIR}/Zee_EleHLTEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"${OUTPUTDIR}/May23_EleHLTEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"elhlt_highpt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"${OUTPUTDIR}/May23_EleHLTEff_pos/190949\",\"png\",0,0,1,\"\",190949,190949\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/Zee_EleGsfSelEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/May23_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/May23_EleGsfSelEff_pos/analysis\",\"png\",0,0,1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

#
# Electron (-) efficiencies
#
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"Zee_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_EleHLTEff/probes.root\",\"R12a_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"Zee_EleGsfSelEff_neg/analysis\",\"png\",0,0,-1\)
root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/R12a_EleGsfSelEff/probes.root\",\"R12a_EleGsfSelEff_neg/analysis\",\"png\",0,0,-1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleHLTEff/probes.root\",\"${OUTPUTDIR}/Zee_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"elhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"${OUTPUTDIR}/May23_EleHLTEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"elhlt_highpt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_EleHLTEff/probes.root\",\"${OUTPUTDIR}/May23_EleHLTEff_neg/190949\",\"png\",0,0,-1,\"\",190949,190949\)

#root -l -q plotEff.C+\(\"elgsfsel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/Zee_EleGsfSelEff_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"elgsfsel.bins\",2,1,2,2,\"${NTUPLEDIR}/May23_EleGsfSelEff/probes.root\",\"${OUTPUTDIR}/May23_EleGsfSelEff_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zee_EleGsfSelEff/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

rm *.so *.d

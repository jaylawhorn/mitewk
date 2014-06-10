#--------------------------------------------------------------
#  Example script to run efficiency calculations
#==============================================================

# directory of probes ntuples
<<<<<<< HEAD
NTUPLEDIR=/scratch/klawhorn/EWKAnaR12a/Efficiency

# Lepton efficiency systematic

#root -l -q plotEff.C+\(\"musel.bins\",1,1,1,1,\"${NTUPLEDIR}/R12a_MuSelEff/probes.root\",\"CB_MuSelEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuTrkEff/probes.root\",\"R12a_MuTrkEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"../R12a_MuStaEff_iso/probes.root\",\"R12a_MuStaEff_iso/analysis\",\"png\",1,0,0\)
=======
NTUPLEDIR=/scratch/klawhorn/EWKAnaStore/8TeV/Efficiency
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

#
# Muon efficiencies
#
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuHLTEff/probes.root\",\"Zmm_MuHLTEff/analysis\",\"png\",0,0,0\)
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_MuHLTEff/probes.root\",\"R12a_MuHLTEff/analysis\",\"png\",0,0,0\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuSelEff/probes.root\",\"R12a_MuSelEff/analysis\",\"png\",0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuTrkEff/probes.root\",\"R12a_MuTrkEff/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuStaEff/probes.root\",\"R12a_MuStaEff/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"musta.bins\",2,2,2,2,\"${NTUPLEDIR}/R12a_MuStaEff_iso/probes.root\",\"R12a_MuStaEff_iso/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_MuHLTEff/probes.root\",\"May23_MuHLTEff/analysis\",\"png\",0,0,0\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff/analysis\",\"png\",0,0,0\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuSelEff/probes.root\",\"May23_MuSelEff/analysis\",\"png\",0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuTrkEff/probes.root\",\"May23_MuTrkEff/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff/probes.root\",\"May23_MuStaEff/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso/analysis\",\"png\",1,0,0\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff_iso/probes.root\",\"May23_MuStaEff_iso/analysis\",\"png\",1,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

#
# Muon (+) efficiencies
#
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuHLTEff/probes.root\",\"Zmm_MuHLTEff_pos/analysis\",\"png\",0,0,1\)
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_MuHLTEff/probes.root\",\"R12a_MuHLTEff_pos/analysis\",\"png\",0,0,1\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuSelEff/probes.root\",\"R12a_MuSelEff_pos/analysis\",\"png\",0,0,1,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff_pos/analysis\",\"png\",1,0,1\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuTrkEff/probes.root\",\"R12a_MuTrkEff_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff_pos/analysis\",\"png\",1,0,1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuStaEff/probes.root\",\"R12a_MuStaEff_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso_pos/analysis\",\"png\",1,0,1\)
root -l -q plotEff.C+\(\"musta.bins\",2,2,2,2,\"${NTUPLEDIR}/R12a_MuStaEff_iso/probes.root\",\"R12a_MuStaEff_iso_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_MuHLTEff/probes.root\",\"May23_MuHLTEff_pos/analysis\",\"png\",0,0,1\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff_pos/analysis\",\"png\",0,0,1\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuSelEff/probes.root\",\"May23_MuSelEff_pos/analysis\",\"png\",0,0,1,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff_pos/analysis\",\"png\",1,0,1\)
root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuTrkEff/probes.root\",\"May23_MuTrkEff_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff_pos/analysis\",\"png\",1,0,1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff/probes.root\",\"May23_MuStaEff_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso_pos/analysis\",\"png\",1,0,1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff_iso/probes.root\",\"May23_MuStaEff_iso_pos/analysis\",\"png\",1,0,1,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f


#
# Muon (-) efficiencies
#
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuHLTEff/probes.root\",\"Zmm_MuHLTEff_neg/analysis\",\"png\",0,0,-1\)
<<<<<<< HEAD
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/R12a_MuHLTEff/probes.root\",\"R12a_MuHLTEff_neg/analysis\",\"png\",0,0,-1\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuSelEff/probes.root\",\"R12a_MuSelEff_neg/analysis\",\"png\",0,0,-1,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuTrkEff/probes.root\",\"R12a_MuTrkEff_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/R12a_MuStaEff/probes.root\",\"R12a_MuStaEff_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso_neg/analysis\",\"png\",1,0,-1\)
root -l -q plotEff.C+\(\"musta.bins\",2,2,2,2,\"${NTUPLEDIR}/R12a_MuStaEff_iso/probes.root\",\"R12a_MuStaEff_iso_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
=======
#root -l -q plotEff.C+\(\"muhlt.bins\",0,0,0,0,\"${NTUPLEDIR}/May23_MuHLTEff/probes.root\",\"May23_MuHLTEff_neg/analysis\",\"png\",0,0,-1\)

#root -l -q plotEff.C+\(\"musel.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\",\"Zmm_MuSelEff_neg/analysis\",\"png\",0,0,-1\)
#root -l -q plotEff.C+\(\"musel.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuSelEff/probes.root\",\"May23_MuSelEff_neg/analysis\",\"png\",0,0,-1,\"${NTUPLEDIR}/Zmm_MuSelEff/probes.root\"\)

#root -l -q plotEff.C+\(\"mutrk.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\",\"Zmm_MuTrkEff_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"mutrk.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuTrkEff/probes.root\",\"May23_MuTrkEff_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuTrkEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\",\"Zmm_MuStaEff_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff/probes.root\",\"May23_MuStaEff_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuStaEff/probes.root\"\)

#root -l -q plotEff.C+\(\"musta.bins\",0,0,0,0,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\",\"Zmm_MuStaEff_iso_neg/analysis\",\"png\",1,0,-1\)
#root -l -q plotEff.C+\(\"musta.bins\",2,1,2,1,\"${NTUPLEDIR}/May23_MuStaEff_iso/probes.root\",\"May23_MuStaEff_iso_neg/analysis\",\"png\",1,0,-1,\"${NTUPLEDIR}/Zmm_MuStaEff_iso/probes.root\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

rm *.so *.d

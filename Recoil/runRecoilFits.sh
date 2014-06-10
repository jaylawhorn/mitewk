#! /bin/bash

<<<<<<< HEAD
INPUTDIR=/scratch/klawhorn/EWKAnaR12a/Selection

#root -l -q fitRecoilZmm.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",2,2,1,0,\"ZmmPfData\"\)
#root -l -q fitRecoilZmm.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",2,2,1,1,\"ZmmMvaData\"\)

#root -l -q fitRecoilZmm.C+\(\"${INPUTDIR}/Zmumu/ntuples/zmm_select.root\",2,2,1,\"ZmmMC\"\)
#root -l -q fitRecoilWm.C+\(\"${INPUTDIR}/Wmunu/ntuples/wm_select.root\",2,2,1,1,\"WmpMC\"\)
#root -l -q fitRecoilWm.C+\(\"${INPUTDIR}/Wmunu/ntuples/wm_select.root\",2,2,1,-1,\"WmmMC\"\)

#root -l -q fitRecoilZee.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",2,2,1,0,\"ZeePfData\"\)
root -l -q fitRecoilZee.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",2,2,1,1,\"ZeeMvaData\"\)

#root -l -q fitRecoilZee.C+\(\"${INPUTDIR}/Zee/ntuples/zee_select.root\",2,2,1,\"ZeeMC\"\)
#root -l -q fitRecoilWe.C+\(\"${INPUTDIR}/Wenu/ntuples/we_select.root\",2,2,1,1,\"WepMC\"\)
#root -l -q fitRecoilWe.C+\(\"${INPUTDIR}/Wenu/ntuples/we_select.root\",2,2,1,-1,\"WemMC\"\)

=======
INPUTDIR=/scratch/klawhorn/EWKAnaStore/8TeV/Selection

root -l -q fitRecoilZmm.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",2,2,1,\"ZmmData\"\)
#root -l -q fitRecoilZmm.C+\(\"${INPUTDIR}/Zmumu/ntuples/data_select.root\",2,2,1,\"ZmmMC\"\)
#root -l -q fitRecoilWm.C+\(\"${INPUTDIR}/Wmunu/ntuples/data_select.root\",2,2,1,1,\"WmpMC\"\)
#root -l -q fitRecoilWm.C+\(\"${INPUTDIR}/Wmunu/ntuples/data_select.root\",2,2,1,-1,\"WmmMC\"\)

root -l -q fitRecoilZee.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",2,2,1,\"ZeeData\"\)
#root -l -q fitRecoilZee.C+\(\"${INPUTDIR}/Zee/ntuples/data_select.root\",2,2,1,\"ZeeMC\"\)
#root -l -q fitRecoilWe.C+\(\"${INPUTDIR}/Wenu/ntuples/data_select.root\",2,2,1,1,\"WepMC\"\)
#root -l -q fitRecoilWe.C+\(\"${INPUTDIR}/Wenu/ntuples/data_select.root\",2,2,1,-1,\"WemMC\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f

rm *.so *.d

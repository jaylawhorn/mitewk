#! /bin/bash

#
# W->munu
#
<<<<<<< HEAD
=======
#root -l -q computeAccGenWm.C+\(\"wmp.conf\",\"Wmunu/plus\",1\)
#root -l -q computeAccGenWm.C+\(\"wmm.conf\",\"Wmunu/minus\",-1\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
root -l -q computeAccSelWm.C+\(\"wmp.conf\",\"Wmunu/plus\",1\)
root -l -q computeAccSelWm.C+\(\"wmm.conf\",\"Wmunu/minus\",-1\)

#
# W->enu
#
<<<<<<< HEAD
=======
#root -l -q computeAccGenWe.C+\(\"wep.conf\",\"Wenu/plus\",1\)
#root -l -q computeAccGenWe.C+\(\"wem.conf\",\"Wenu/minus\",-1\)
#root -l -q computeAccSCWe.C+\(\"wep.conf\",\"Wenu/plus\",1\)
#root -l -q computeAccSCWe.C+\(\"wem.conf\",\"Wenu/minus\",-1\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
root -l -q computeAccSelWe.C+\(\"wep.conf\",\"Wenu/plus\",1\)
root -l -q computeAccSelWe.C+\(\"wem.conf\",\"Wenu/minus\",-1\)

#
# Z->mumu
#
<<<<<<< HEAD
=======
#root -l -q computeAccGenZmm.C+\(\"zmm.conf\",\"Zmumu\"\)
#root -l -q computeAccSelZmm.C+\(\"zmm.conf\",\"Zmumu\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
root -l -q computeAccSelZmmBinned.C+\(\"zmm.conf\",\"Zmumu\"\)

#
# Z->ee
#
<<<<<<< HEAD
=======
#root -l -q computeAccGenZee.C+\(\"zee.conf\",\"Zee\"\)
#root -l -q computeAccSCZee.C+\(\"zee.conf\",\"Zee\"\)
#root -l -q computeAccSelZee.C+\(\"zee.conf\",\"Zee\"\)
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
root -l -q computeAccSelZeeBinned.C+\(\"zee.conf\",\"Zee\"\)

rm *.so *.d

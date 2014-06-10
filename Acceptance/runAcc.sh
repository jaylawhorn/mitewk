#! /bin/bash

#
# W->munu
#
root -l -q computeAccSelWm.C+\(\"wmp.conf\",\"Wmunu/plus\",1\)
root -l -q computeAccSelWm.C+\(\"wmm.conf\",\"Wmunu/minus\",-1\)

#
# W->enu
#
root -l -q computeAccSelWe.C+\(\"wep.conf\",\"Wenu/plus\",1\)
root -l -q computeAccSelWe.C+\(\"wem.conf\",\"Wenu/minus\",-1\)

#
# Z->mumu
#
root -l -q computeAccSelZmmBinned.C+\(\"zmm.conf\",\"Zmumu\"\)

#
# Z->ee
#
root -l -q computeAccSelZeeBinned.C+\(\"zee.conf\",\"Zee\"\)

rm *.so *.d

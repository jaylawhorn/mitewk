<<<<<<< HEAD
{

  gROOT->Macro("../Utils/CPlot.cc++");
  gROOT->Macro("../Utils/MitStyleRemix.cc++");

  // Show which process needs debugging                                                                                                                
=======
{    

    gROOT->Macro("../Utils/CPlot.cc++");
    gROOT->Macro("../Utils/MitStyleRemix.cc++");  
               
  // Show which process needs debugging
>>>>>>> 73ecf38fbabb525fd7faab1c6457f2661f15464f
  gInterpreter->ProcessLine(".! ps |grep root.exe");
}

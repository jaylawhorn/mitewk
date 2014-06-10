{

  bool foundIt=true;
  cout << " ROOT Version: " << gROOT->GetVersion() << "." << endl;
  char *cmsbase=gSystem->Getenv("CMSSW_BASE");
  if (cmsbase==NULL) {
    cout << " CMSSW environment has not been set up." << endl;
    foundIt=false;
  } else {
    cout << " CMSSW environment is set up." << endl;
    gSystem->Load("/home/klawhorn/CMSSW_5_2_3/src/Delphes/Delphes-3.0.8/libDelphes.so");
    gROOT->ProcessLine(".include /home/klawhorn/CMSSW_5_2_3/src/Delphes/Delphes-3.0.8");
    gROOT->ProcessLine(".include /home/klawhorn/CMSSW_5_2_3/src/Delphes/Delphes-3.0.8/external");
    
  }
}

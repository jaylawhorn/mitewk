#!/bin/bash
#===================================================================================================
# Submit a set of jobs to run over a given dataset, splitting the jobs according to the filesets.
#
#===================================================================================================

WORKDIR=`pwd`

SCRIPT=$WORKDIR/runTestCondor.sh

OUTPUTDIR=/scratch/klawhorn/
condor=$WORKDIR/submit.condor

cat > $condor <<EOF
Universe                = vanilla
Requirements            = ((Arch == "X86_64") && (Machine != "t3btch112.mit.edu") && (Disk >= DiskUsage) && ((Memory * 1024) >= ImageSize) && (HasFileTransfer))
Notification            = Error
Executable              = $SCRIPT
Arguments               = $FILESET $DATASET $BOOK $CATALOG $ISDATA $USEGEN $FSRMODE $NEVENTS $SKIPHLTFAIL
Input                   = /dev/null
Initialdir              = $OUTPUTDIR
Output                  = ${OUTPUTDIR}/test.out
Error                   = ${OUTPUTDIR}/test.err
Log                     = /tmp/condor${datestring}_${FILESET}.log
GetEnv                  = True
Rank                    = Mips
should_transfer_files   = YES
when_to_transfer_output = ON_EXIT
Queue
EOF
  
  # Finally, submit the jobs
  echo "Submitting job"
  condor_submit $condor

#exit 0

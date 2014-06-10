#!/bin/bash
#---------------------------------------------------------------------------------------------------
# Execute one job (works interactively and when executed in condor)
#---------------------------------------------------------------------------------------------------
h=`basename $0`
HADOOP_BASE="/cms/store/user/paus"
BASE="/mnt/hadoop$HADOOP_BASE"
# start waiting time now
startTime=$(date +%s)

catalogDir=$1
      book=$2
   dataset=$3
      skim=$4
   fileset=$5

# some basic printing
echo " "
echo " INFO ($h) - Show what we will do";
echo " "
echo "      arguments: $*";
echo " ";

# First make the filelist
files=""
for line in `cat $catalogDir/$book/$dataset/Files | grep ^$fileset`
do
  if [ "`echo $line | grep root`" != "" ]
  then
    files="$files $line"
  fi
done

# Enter the download requests into the database
stage=0
for file in `echo $files`
do
  hadoop fs -test -e  "$HADOOP_BASE/$book/$dataset/$file" >% /dev/null
  if [ "$?" != "0" ]
  then
    ~cmsprod/SmartCache/addDownloadRequest.py --file=$file --dataset=$dataset --book=$book
    stage=1
  else
    echo " INFO: file already staged $BASE/$book/$dataset/$file (short sleep follows)."
    sleep 1
  fi
done

# Now check every now and then whether they have completed
done=0
while [ "$done" == "0" ] && [ "$stage" == "1" ]
do
  nowTime=$(date +%s)
  duration=$(($nowTime - $startTime))
  echo " Waiting time --> $duration sec"
  sleep 10
  done=1
  for file in `echo $files`
  do
    ~cmsprod/SmartCache/checkDownloadRequest.py --file=$file --dataset=$dataset --book=$book
    if [ "$?" == "0" ]
    then
      done=0
      break
    fi
  done
done

# make sure files are really available
for file in `echo $files`
do
  hadoop fs -test -e  "$HADOOP_BASE/$book/$dataset/$file" >% /dev/null
  if [ "$?" != "0" ]
  then
    echo " ERROR:   file not staged $BASE/$book/$dataset/$file"
    exit 1
  else
    echo " SUCCESS: found staged file $BASE/$book/$dataset/$file (short sleep follows)."
    sleep 1
  fi
done

exit 0

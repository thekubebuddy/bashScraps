#!/bin/bash

source ./Master.config
NOW=$(date +"%d%h%Y_%H%M%S")
LOG_FILE=LOGFILE_$NOW.txt
#exec 3>&1 1>>$LOG_FILE 2>&1


echo $NOW
call_test_20()
{
	echo "Calling the test_20 function"
	echo "------------------------------------------"
	ssh -o "StrictHostKeyChecking no" pi@$piIp<<-EOF
	cd $HOME/Desktop
	./test20.sh $1
	EOF
	echo "------------------------------------------"
	echo "Function called successfully"
}

echo "Calling the while loop" 

getQueueDepth()
{
	echo $RANDOM
}

count=0
prevDepth=0

while [ $count -le $noOfIterations ]
do

currentDepth=$(getQueueDepth)

echo "current depth: $currentDepth"
echo "previous depth: $prevDepth"
echo "count: $count"
if [ $currentDepth -lt $prevDepth ]
then 
	echo "condition satisfied"
	count=$((count+1))
else
	prevDepth=$currentDepth
	#sleep $intervalInSec
fi

sleep $intervalInSec

done








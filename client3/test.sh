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

#echo "Calling the while loop" 

getQueueDepth()
{
	echo $RANDOM
}

count=1
prevDepth=0

:<<COMMENT
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
COMMENT




validateQueueDepthTest()
{
	source ./Master.config
	queueDepth=$(echo $QDEPTH)
	prevDepthVal="$QDEPTH"
	if [ "$queueDepth" != "0" ]
	then 
	echo ">>Remote queue is still non zero"
	echo ">>Calling mtasCq -c"
	echo ">>Calling mtasCqReply "
	# mtasCQ -c
	# mtasCReply -c
	return 1
	else
	echo ">>Remote queue depth is zero"
	return 0
	fi
}

prevDepthVal=0

test1()
{
#source ./Master.config
#prevDepthVal=$QDEPTH
#prevDepthVal=0
SECONDS=0

echo "prevDepthValue: $prevDepthVal"

validateQueueDepthTest
echo ">> prevDepthValue: $prevDepthVal"



echo "Calling test1 function for max 3 iterations for an interval of $intervalInMin"

while [[ $count -le 3 ]]
do
#source ./Master.config
#echo "QDEPTH=$QDEPTH"
#currentDepthVal=$QDEPTH

echo "COUNT: $count"
echo "CurrentDepth: $currentDepthVal"
echo "PreviousDepth: $prevDepthVal"

if [ "$currentDepthVal" == "0" ]
then 
echo "Current depth becomes zero"
break
fi

if [ "$prevDepthVal" == "$currentDepthVal" ] 
then
echo "Prev and current depth value is same"
echo "Count incremented by 1"
count=$((count+1))
else
prevDepthVal=$currentDepthVal
fi
if [[ $count -eq 3 ]]
then
echo "COUNT: $count"
echo "CurrentDepth: $currentDepthVal"
echo "PreviousDepth: $prevDepthVal"
echo "Test failed"
break
fi
sleep $intervalInMin
done

echo "Total time for depth to be 0: $((SECONDS/60)) minutes $((SECONDS%60))
seconds"

}


#./test.sh test1
#./test.sh load 122220

case $1 in 
	"load")
		sed -i "s/QDEPTH=.*/QDEPTH=$2/g" ./Master.config
		echo "Loaded with $2xml load"
	 ;;
	 "runtest1"|"test1")
	 	test1
	 ;;
	*)
	echo "Invalid funtion call"
	;;
esac




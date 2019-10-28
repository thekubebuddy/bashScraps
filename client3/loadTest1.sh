#!/bin/bash

source ./Master.config
NOW=$(date +"%d%h%Y_%H%M%S")
LOG_FILE=LOGFILE_$NOW.txt
exec 


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
# Creating a LOG file
#touch $LOG_FILE
#call_test_20 start
i=1


getRemoteDepth()
{
 	if [ "$i" -eq 2 ]
	then
		echo "0"
	else
		echo "hello\n"
	
	fi
}

validateQueueDepthTest()
{
	queueDepth=$(getRemoteDepth)
	echo $queueDepth
	if [ "$queueDepth" != "0" ]
	then 
		echo "QueueDepth is not zero\n"
		echo "Calling mtascq -c\n"
		#mtasCQ -c
		#mtasCReply -c
	else
		echo "Queue Depth had became zero\n"
	fi
}
while [ $i -le $noOfIterations ]
do
#echo "In while"
echo "-----------------------------------------------"
retValue=$(validateQueueDepthTest)
echo -e $retValue
echo "-----------------------------------------------"
if [[ "$retValue" == *"became zero"* ]]
then
	echo "yes the queue becames zero"
	echo "breaking the while loop"
	break
fi
i=$((i+1))
done






#!/bin/bash

source master.config
i=0

#noOfIterations=2
#intervalInSec=2

remoteDepth=4
getRemoteDepth()
{
	# Retruning a dummy remote queue depth
	echo $remoteDepth

}


validateQueueDepthTest()
{
	queueDepth=$(getRemoteDepth)
	
	echo "QueueDepth: $queueDepth"
	if [[ $queueDepth -ne 0 ]]
	then
	 echo ">>Remote queue is still non zero"
	 echo ">>Calling mtasCq -c"
	 echo ">>Calling mtasCqReply "
	 return 0
	else
	  echo ">>Remote queue depth is zero"
	  return 1
	fi
	
}



echo "Calling queueDepthFunction for $noOfIterations time for an interval of $intervalInSec"
while [[ $i -le $noOfIterations ]]
do
echo ">>in while loop"
echo "----------------------------------------"
validateQueueDepthTest
retValue=$?
echo "----------------------------------------"

if [[ $retValue -eq 1 ]]
then
echo "Queue depth returns zero"
echo "Breaking the while loop"
break
fi

sleep $intervalInSec
i=$((i+1))
remoteDepth=$((remoteDepth-1)) # decrementing the remoteDepth value by one
done





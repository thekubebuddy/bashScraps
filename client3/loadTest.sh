#!/bin/bash
source master.config
#noOfIterations=2
#intervalInSec=2
i=0
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
	if [[ "$queueDepth" != "0" ]]
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



echo "Calling queueDepthFunction for $noOfIterations time for an interval of $intervalInSec"
while [[ $i -le $noOfIterations ]]
do
#echo ">>in while loop"
echo "----------------------------------------"
validateQueueDepthTest  #Validate queue funtion returns 
retValue=$?
echo "----------------------------------------"

# If the retValue from validataQueueDepthTest is 1,means no pending requests in queue

if [[ $retValue -eq 0 ]]
then
echo "Queue depth returns zero"
echo "Breaking the while loop"
break
fi

sleep $intervalInSec
i=$((i+1))
remoteDepth=$((remoteDepth-1)) # decrementing the remoteDepth value by one
done





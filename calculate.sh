#!/bin/bash

#exec 3>&1 



calculate_diff()
{
	echo "starttime: $1"	
	echo "endtime: $2"
	diff=$(( $(date -d "$2" "+%s") - $(date -d "$1" "+%s") ))
	echo "scale=2 ; $diff/3600" | bc  
	#echo "timediff:$diff"
}


starttime=$(date "+%H:%S")
echo $starttime 

SECONDS=0 # add this 

i=1
while [ $i -ne 6 ] 
do
echo "$(date "+%H:%S")=>in while"
sleep 1
i=$((i+1))
done

durationInSeconds=$SECONDS # add this
echo "Total time taken: $(($durationInSeconds / 60)) minutes and $(($durationInSeconds % 60)) seconds."  # add this

#endtime=$(date "+%H:%S")
#calculate_diff $starttime $endtime




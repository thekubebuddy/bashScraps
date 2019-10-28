#!/bin/bash

#exec 3>&1 



calculate_diff()
{
	echo "starttime: $1"	
	echo "endtime: $2"
	diff=$(( $(date -d "$2" "+%s") - $(date -d "$1" "+%s") ))
	echo "scale=2 ; $diff/60" | bc  
	#echo "timediff:$diff"
}


starttime=$(date "+%H:%S")
echo $starttime

i=2
while [ $i -ne 20 ] 
do
echo "$(date "+%H:%S")=>in while"
sleep 1
i=$((i+1))
done
endtime=$(date "+%H:%S")
calculate_diff $starttime $endtime




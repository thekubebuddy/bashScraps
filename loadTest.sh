#!/bin/bash

a=$1 #--> iterations
b=$2 #--> seconds
i=1

get_hello()
{
 echo "Hello world function"
   return 1
}


echo "Calling the get_hello for $a time for an inerval of $b seconds" 
while [[ "$i" -le "$a" ]]
do
#echo "in while "

#retVal=$get_hello
echo retVal:"$retVal"

sleep $b
i=$((i+1))
#echo "sleeping mode"
done








#!/bin/bash

source ./parameter.config
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
touch $LOG_FILE
call_test_20 start

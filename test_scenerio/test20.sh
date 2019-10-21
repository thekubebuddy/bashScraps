#!/bin/bash

case $1 in
	"Start"|"start")
		echo "Test 20 started" | tee test20.txt
	;;
	*)
		echo "Invalid request"
	;;
esac

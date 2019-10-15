#!/bin/bash

get_file()
{
echo "Finding the $1 in $PWD"
find $HOME/Desktop -type f -name $1 

}


echo -e "Hello world\n"

[ "$1" == "" ] && { echo "Please enter the name"; exit 0; } 

PARAM1=$1
PARAM2=$2
echo "Entered PARAM: $PARAM1"


case $PARAM1 in
	"hello" | "Hello")
	echo -e "You have entered $PARAM1"	
	;;
	"get" | "GET" )
	echo -e "Calling the get file module"
	get_file $PARAM2
	;;	
	*)
	echo -e "No suitable record found"
	;;
esac


#!/bin/bash

# Dynamically storing all the cmd-line arguments and echo'ing

for x in $@ 
do
echo "$PWD"/$x "$HOME/Trash" 
done

# $* Storing all the arguments entered on cmdline ($1 $2 $3...)

# "$@" Storing all the arguments entered on cmdline, individually quoted("$1","$2","$3"..)

# $0 Stores the first word of the entered commd (i.e name of the scrpt)
# $# Stores the number of cmd-line arguments passed to the script 

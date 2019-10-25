#!/bin/bash


TRASH_PATH="$HOME"/trash
CURRENTDIR=`pwd`

for file in "$CURRENTDIR"/$*
do mv "$file" "$TRASH_PATH"
done

exit 0

# Mimicking the "rm" functionality with one of the large difference

# mkdir -p $HOME/trash
# touch ~/my_rm
# copy the contents 
# chmod 700 ~/my_rm





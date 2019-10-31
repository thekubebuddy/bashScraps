#!/bin/bash

exec 3>&1 1>STATS_FILE.txt 2>&1 

get_fsstat()
{

echo "=========================================="
echo "Getting the filesystem stats"
echo "=========================================="
df -h 

}

get_diskusestat()
{
echo "=========================================="
echo "Getting the jboss stats"
du -sh $PWD/jboss*/
du -sh $PWD/jboss*/*
echo "=========================================="
echo "Getting the standalone stats within jboss"
du -sh $PWD/**/standalone/*
echo "=========================================="
echo "Getting the jboss tmp directory stats"
du -sh $PWD/jboss*/standalone/tmp/
du -sh $PWD/**/standalone/tmp/*
echo "=========================================="

#du -sh /home/$USER/jboss-*/*
#du -sh **/standalone/
}

list_war()
{
echo "=========================================="

echo "Getting all the wars and size within the jboss"


find $PWD/jboss* -name *.war -exec du -sh {} \;

:<<COMMENTS
echo "==========================================" >&3
echo "WAR FILES FOUND" >&3
echo "==========================================" >&3
for war in $(find $PWD/jboss* -name *.war)
do
echo $war	>&3
done
echo "==========================================" >&3
COMMENTS

echo "=========================================="

}

get_folderstat()
{
if [[ "$#" -gt 1 ]]
then
	echo "more than one folder"
	for folder in "$@"
	do
		#echo "$folder"
		du -sh $folder
	done
fi
}

echo "Calling file_system stat funtion.." >&3 
get_fsstat 1>&3
echo "Getting all .war withing jboss" 	>&3
list_war 
echo "Calling jboss stat funtion.." >&3 
get_diskusestat
#echo "Calling the folder stat function"
#FOLDER1=/home/jenkins/LOGS/
#FOLDER2=/home/jenkins/workspace/*
#get_folderstat $FOLDER1 $FOLDER2 >&3

#sshpass -p "$PASS" ssh jenkins@192.168.83.15 




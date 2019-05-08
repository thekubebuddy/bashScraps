# Rsync

1. Rsync command provides fast,incremental file transfer 
between local to remote or local to local folder on the same machine.
2. File Transfers are incremental and fast 
(i.e it copies only what is changed and not entire directory) 
3. It follows ssh protocol while transferring.
4. Syntax is similar to scp/sc/ssh command.
	rsync [option] source desti.
	different [option]:
	-v: verbose ON
	-z: compress file data
	-h: Human readable
	-a: archive mode(timestamp,symbolic links,permission etc are preserved)
	-r: transfer recursively(timestamp and permission not preserved)

Example1:

**Syncing Files on same local machine**
```
rsync File.txt /home/user1/Desktop/
```

Example2:

**Syncing folder on same local machine**
```
rsync -zavh FOLDER(source) /home/user1/Desktop/FOLDER(desti)
```
desti folder name can be any of choice 
archiving, and compressing with verbose in human readable form

Example3:

**Syncing Folder from local to remote machine**
```
rsync -zavh ~/Desktop/folder1 username@ip:~/destinition/folder/path/folder1 
#rsync -zavh SFOLDER/ jhon@192.168.83.103:/home/jhon/Desktop/DFOLDER/
```

Example4:

**Syncing Folder from remote to local machine**
```
rsync -zavh username@ip:~/destinition/folder/path/folder1 ~/fast/web/host/folder1 
```

Example5:

**include and exclude**
Syncing Folder from local to remote machine including only some extensions file
```
rsync -zavh --include '*txt' --exclude '*' SFOLDER/ jhon@192.168.83.103:/home/jhon/Desktop/DFOLDER 
#rsync -zavh BASHES/ jhon@192.168.83.103:/home/jhon/Desktop/BASHES/
```
It will include **.txt** file and exclude **all** the files in "SFOLDER"


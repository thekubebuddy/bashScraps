Table of Contnents
===================
1. [Find](#1-find)
2. [grep](#2-grep)
3. [du and df](#3-du-and-df)
5. [wc](#4-wc--lines-words-characters-)
4. [cat head tail](#5-tail-head-cat)
6. [grep](#2-grep)
7. [Read lines from Stream](#7-whil)


### 1. Find
```
 find ./ -name '\*.sh'

 find ./ -type f \\( -name  '\*.sh.\*' -o -name '\*.sh' \\)
 -size 1k 1M 1w(byte)
 -mtime 
 -atime 
 -perm
 -exec {} \; 
```

### 2. grep 
```
grep -irln ./ --color -e 'hello\*'  
grep -irlE ./ -e 'hell'
grep -irnE ./ -e 'Example\*|unannotated\*' --color
grep -v '#' abc.yaml 	#exclude all lines with # symbols
```

### 3. du and df
```
du -sh .
du -sh *
df -h
```

### 4. wc ( lines words characters )
```
cat abc.txt | wc
cat abc.txt | wc -l  
cat abc.txt | wc -c  // run the characters
cat abc.txt | wc -L  // longest line 
```



### 5. tail head cat

```
cat -n abc.txt #catting with lines
vim +15 abc.txt  // opening vim on 15lines
tail -f abc.txt  
head -n 10 abc.txt
```

### 6. SED

```
sed '/^$/d'
sed 's/parttime/fulltime/1' abc.txt => first occurence in line
sed 's/parttime/fulltime/2' abc.txt => 2nd occurence in line
sed -n 1p abc.txt #show only the 1st line
sed 's/parttime/fulltime/1w abcd.txt' abc.txt => substitude and write it into abcd.txt
sed '11 s/parttime/fulltime/' abc.txt => replace only on 11line
sed '11 s/parttime/[fulltime]/2' abc.txt => replace only on 11line 2nd occurnce
sed '1,5 s/parttime/fulltime/' abc.txt => replace between 1,5 lines

sed 's|//.\*||' abc.txt # all comments  replacements

sed '$d' abc.txt # delete last line

sed '1s/.*/enabled: true/; 2s/:.*/: false/' fiat.yml # ".*" anything

sed -i 's/LoadBalancer/NodePort/;s/31380/30080/' file.yaml #multiple replcemnet


```

### 7. SSH  
``` 
ssh-keygen 
ssh-copy-id user@ip
ssh user@ip -L 8080:localhost:8080 # Port forwarding with ssh tunnel with no reverse proxy or ssl
ssh -T git@github.com #check the git ssh connections

```

### 8. **Running all sudo cmds without any root/sudo passwd**
/etc/sudoers or visudo
```
user ALL=(ALL) NOPASSWD: ALL 
%user_grp ALL=(ALL) NOPASSWD: ALL
```

### 9. telnet, netstat, nslookup
```
netstat -tupln # listing all listening ports with there application name if sudo is used
nslookup google.com # resoloving the dns name to addrs
telnet google 80 # checking whether google is listening with port 80

```

### 10. vim
```
:set ai
:set ru
:set nu
:set ts=2 #tabstop
:set tw=2 #tabwidth
:set et
:le 3 #left indent with 3space
gg #top
GA #bottom
:m 1 #move current line up by 1 
```

### 11. bashrc
```	
PS1="\033[01;34m~> \[\033[00m\]"
PS1="'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\$\[\033[00m\] '"
\033[01;34m
```

### 12. Read lines from stdin or a file
```
while read line
do
echo $line
done

for line in $(cat file.txt)
do
echo $line
done
```

### 13. cat stdin into a file
```
cat > file.txt <<-EOF
line1 
line2
line3
line4
line5
EOF
```

### replace '\n' with '\t' and paste
```
cat file.csv | tr '\n' '\t'
```
* paste is usefull when we want to merge the line of a file. Into a single line or based on delimeter
* paste with a filename is similar as that of cat cmd
```
paste file1.txt # cat file1.txt
```


1. Find
 find ./ -name '\*.sh'
 find ./ -type f \\( -name  '\*.sh.\*' -o -name '\*.sh' \\)
 -size 1k 1M 1w(byte)
 -mtime 
 -atime 
 -perm
 -exec {} \; 

2. grep 
grep -irln ./ --color -e 'hello\*'  
grep -irlE ./ -e 'hell'
grep -irnE ./ -e 'Example\*|unannotated\*' --color

3. du
du -sh .
du -sh *

4. wc ( lines words characters )
cat abc.txt | wc
cat abc.txt | wc -l  
cat abc.txt | wc -c  // run the characters
cat abc.txt | wc -L  // longest line 




5. tail head cat
cat -n abc.txt
vim +15 abc.txt  // opening vim on 15lines
tail -f abc.txt  
head -n 10 abc.txt

6. SED

sed '/^$/d'
sed 's/parttime/fulltime/1' abc.txt => first occurence in line
sed 's/parttime/fulltime/2' abc.txt => 2nd occurence in line
sed -n 1p abc.txt
sed 's/parttime/fulltime/1w abcd.txt' abc.txt => substitude and write it into abcd.txt
sed '11 s/parttime/fulltime/' abc.txt => replace only on 11line
sed '11 s/parttime/[fulltime]/2' abc.txt => replace only on 11line 2nd occurnce
sed '1,5 s/parttime/fulltime/' abc.txt => replace between 1,5 lines
sed 's|//.\*||' abc.txt ==> all comments  replacements

7. SSH  
ssh-keygen 
ssh-copy-id user@ip

**Running all sudo cmds without any root/sudo passwd**
/ect/sudoers or visudo

user ALL=(ALL) NOPASSWD: ALL 
%user_grp ALL=(ALL) NOPASSWD: ALL



 
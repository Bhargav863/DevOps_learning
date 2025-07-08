## File and directory Management
**ls – List Directory Contents**
```
ls -lrt
l - long listing
r - reverse order
t - based on time modified
```
**cd – Change Directory**
* cd ~ --> Navigate to Home directory
* cd - --> Navigate to previous working directory.
* cd .. --> Go one directory back.

**pwd - shows current working directory you are in**

**mkdir - make/create directories**
```
mkdir dir1
mkdir -p /dir1/dir2
p -> Specify the path where you want to create direcory
```
**rm -> remove files/directories**
```
rm -rf /tmp/project/
```
* r -> recursive (Loop through all directories and files)
* f -> Force removal
**cp - copy files from one directory to another**
```
cp file.txt /tmp
cp -r /etc/ /tmp/project/
```
* r- recursive (copies all files and directories)
**mv – Move/Rename Files**
```
mv suresh.txt ramesh.txt
mv /app/project/* .
```
* **.** --> refers current directory

## Viewing and editing files

**cat <file_name>-> display entire file content**
```
cat file1.txt
```
**less - View file page by page (scroll with arrows, / to search)**
```
less /var/log/syslog
```
**head - shows top 5 lines in file**
```
head /var/log/syslog
head -n 10 /var/log/syslog #shows first 10 lines in the file
```
* n -> specify the number of files
**tail - shows bottom 5 lines in file**
```
tail /var/log/syslog
tail -f /var/log/syslog
tail -10f /var/log/syslog
```
* f - follow logs in real time
* 10f - It will show bottom 10 lines



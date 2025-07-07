# Linux File System
The Linux file system is a hierarchical structure that organizes files and directories under a single root directory, represented by "/".

## 1. / - Root
  * Every single file and directory starts from the root directory.
  * Only root user has write privileges under this directory.
  * Mounted first during boot time.
  ```
  cd / && ls -lrt
  ```
## 2. /bin - User binaries
   * Contains binary Executables.
   * Basic linux commands you need to use in single user modes are located under this directory.
   * Examples: ls, cat, cp, mv, rm, echo, bash
   ```
   cd /bin && ls -lrt
   ```
## 3. /sbin - system binaries
   * Contains super user/ root user binary executables.
   * Linux commands located under this directory are used typically by system administrator.
   * Examples: init, ifconfig, reboot, fsck, iptables
### try this
```
cd /sbin && ls -lrt
```
## 4. /etc - System configuration Files
   * Contains configuration files required by all programs.
   * This also contains startup and shutdown shell scripts used to start/stop individual programs.
   * For example : /etc/resolv.conf, /etc/logrotate.conf, /etc/fstab, /etc/passwd, /etc/ssh/ sshd_config
try this
 ```
cat /etc/passwd
cat /etc/fstab
```
## 5. /dev - device files
   * Contains device files.
   * Treats devices as files: hard disks, terminals, USBs.
   * For example 
        1) /dev/sda1 -> First disk partition
        2) /dev/null -> BitBucket
        3) /dev/random -> Random number generator
Explore /dev
```
cd /dev && ls -lrt
```
## 6. /proc - process Information
   * Contains information about system process.
   * Mounts at runtime; not stored on disk.
   *  Examples:
        1) /proc/cpuinfo
        2) /proc/meminfo
        3) /proc/<PID>/status
## 7. /var - variable files or varible data
   * Content of the file that expected to grow can be found under this directory.
   * Logs, spool files, PID files, mail queues, databases files grows overtime.
   * Key subdirs:
        1) /var/log – Logs
        2) /var/spool – Print/mail queues
        3) /var/tmp – Persistent temporary file
try this
```
tail -f /var/log/syslog
```
## 8. /tmp - Temporary Files
   * Directory that contains temporary files created by system and users.
   * Files under this directory are deleted when system is rebooted.
## 9. /usr - User Programs
   * Contains binaries, libraries, documentation, and source code for second level programs.
   * If you can't find a user binary under /bin, look under /usr/bin. Ex:- awk,less,scp etc.,
   * If you can't find a super user binary under /sbin, look under /usr/sbin. Ex:- useradd,userdel
   * /usr/lib contains libraries for /usr/bin and /usr/sbin.
   * /usr/local contains user programs that you install from source. For example, When you install apache from source, it goes under /usr/local/apache2.
   *  /usr ≠ “user” — it means **Unix System Resources**
## 10. home - Home directories
   * Home directories for all user to store personal files.
   * For example: /home/ramesh, /home/suresh
try this
```
ls -la
```
## 11. /root – Superuser’s Home
   * Root user’s personal home (not /home/root) and only accessible by root.
   * Useful during system recovery
## 12. /boot - Boot Loader files
   * Contains boot loader related files.
   * Key files:
        1) vmlinuz-* – Kernel binary
        2) initrd.img – Initial RAM disk
        3) grub.cfg – Boot menu configuration
try this
```
ls \boot
```
## 13. /lib  /lib64 - Shared Libraries
   * Required for binaries in /bin and /sbin
   * Contains kernel modules: /lib/modules/$(uname -r)
   * Holds .so shared object files (dynamic libraries)
## 14. /opt – Optional Packages
   * For installing 3rd-party software (like Oracle, Chrome)
   * Self-contained apps that don't follow FHS
   * Example: /opt/google/chrome/
## 15. /mnt - Mount directory
   * Temprary mount directory where sysadmins can mount files.
## 16. /media - Removable Media devices
   * Temporary mount directory for removable devices.
   * Example:- USB, CD-ROM
## 17. /srv - Service data
   * Stores site or service-specific files 
   * Used in enterprise setups
   * Example: /srv/www/, /srv/ftp/
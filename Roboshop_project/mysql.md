### MySQL
Developer has chosen the database MySQL. Hence, we are trying to install it up and configure it.

However our application needs MySQL 5.7. So lets disable MySQL default version.
```
yum module disable mysql -y 
```
Setup the MySQL5.7 repo file

```
vim /etc/yum.repos.d/mysql.repo
```

```
[mysql]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0
```

Install MySQL Server

```
yum install mysql-community-server -y
```
Update the bind Ip address in the /etc/my.cnf
```
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
bind-address = 0.0.0.0

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
```

Start MySQL Service

```
systemctl enable mysqld
```
```
systemctl start mysqld
```
Next, We need to change the default root password in order to start using the database service. Use password RoboShop@1 or any other as per your choice.
First check the default password and save it. It is used to change the root password.
```
grep 'temporary password' /var/log/mysqld.log
```
Run below command and provide the temporary password and change the password.
```
mysql_secure_installation
```
You can check the new password working or not using the following command in MySQL.

```
mysql -uroot -pRoboShop@1
```  
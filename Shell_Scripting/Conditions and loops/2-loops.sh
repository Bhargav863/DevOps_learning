#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

User_id=$(id -u)
LogFile=/tmp/log.txt

if [ $User_id -ne 0 ]; then
    echo "Hello, Please run this as a root/sudo user"
fi

validate() {
    if [ $1 -eq 0 ]; then
        echo -e "$G $2 is installed successfully...$N"
    else
        echo -e "$R $2 is failed to install...$N"
        exit 1
    fi
}

for i in $@; do
    yum list installed $i &>>$LogFile
    if [ $? -ne 0 ]; then
        echo -e "$Y...$i is not present...Installing...$N"
        yum install $i -y &>>$LogFile
        validate $? "$i"
    else
        echo -e "$G..$i is already installed..$N"
    fi
done

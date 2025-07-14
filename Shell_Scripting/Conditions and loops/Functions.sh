#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Hello, Please run this as a root/sudo user"
fi

Validate() {
    if [ $1 -eq 0 ]; then
        echo -e "$G $2 is installed successfully...$N"
    else
        echo -e "$R $2 is failed to install...$N"
        exit 1
    fi
}

# $1 & $2 are the arguments to be passed when the function is called.

yum install nginx -y

Validate $? "Nginx"

yum install docker -y

Validate $? "docker"

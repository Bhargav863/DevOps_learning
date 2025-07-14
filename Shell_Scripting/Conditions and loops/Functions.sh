#!/bin/bash

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Hello, Please run this as a root/sudo user"
fi

Validate() {
    if [ $1 -eq 0 ]; then
        echo "$2 is installed successfully"
    else
        echo "$2 is failed to install"
        exit 1
    fi
}

# $1 & $2 are the arguments to be passed when the function is called.

yum install nginx -y

Validate $? "Nginx"

yum install docker -y

Validate $? "docker"

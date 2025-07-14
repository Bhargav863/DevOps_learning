#!/bin/bash

#Write a script to install nginx as a root user.

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Hello, Please run this script as a root user"
    exit 1 #exit the script with exit codes
fi

yum install nginx -y

#check if the installation is successful or not

if [ $? -ne 0 ]; then
    echo "Failed to install nginx"
else
    echo "Nginx installed successfully"
fi

yum install docker -y
# check if docker is successfully installed or not

if [ $? -ne 0 ]; then
    echo "Failed to install docker"
else
    echo "Docker installed successfully"
fi

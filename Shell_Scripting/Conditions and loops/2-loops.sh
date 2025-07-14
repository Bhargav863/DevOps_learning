#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

User_id=$(id -u)

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
    yum install $i -y
    validate $? "$i"
done

#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

User_id=$(id -u)
LOGSDIR=/tmp
SCRIPT_NAME=$(basename "$0")
DATE=$(date +%F-%H-%M-%S)
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log


if [[ $User_id -ne 0 ]];
then
echo -e "$R ERROR:: Please run this script as a root user or with sudo privileges $N"
exit 1
fi

validate(){
    if [[ $1 -ne 0 ]];
    then
       echo -e "$2 ...$R Failed $N"
    else
       echo -e "$2...$G success $N"
    fi
}

apt-get update &>>$LOGFILE
validate $? update 

apt-get install ca-certificates curl &>>$LOGFILE
validate $? 'curl and ca-cert'  

install -m 0755 -d /etc/apt/keyrings &>>$LOGFILE
validate $? permission_setup 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc &>>$LOGFILE
validate $? gpg_key_download
sudo chmod a+r /etc/apt/keyrings/docker.asc &>>$LOGFILE
validate $? permissons_setup 

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
validate $? Repository_setup

apt-get update &>>$LOGFILE
validate $? update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin &>>$LOGFILE
validate $? 'installation of docker is'

systemctl start docker &>>$LOGFILE

validate $? "Docker Started"

systemctl enable docker &>>$LOGFILE

validate $? "Docker Enabled"

usermod -aG docker ubuntu &>>$LOGFILE

validate $? "ubuntu user added to docker group"

echo -e "$R Please logout and login again $N"
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

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp &>>$LOGFILE
validate $? "Downloaded eksctl command"
chmod +x /tmp/eksctl &>>$LOGFILE
validate $?  "Added execute permissions to eksctl"
mv /tmp/eksctl /usr/local/bin &>>$LOGFILE
validate $? "moved eksctl to bin folder"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &>>$LOGFILE
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl &>>$LOGFILE

validate $? "kubectl installed"

git clone https://github.com/ahmetb/kubectx /opt/kubectx &>>$LOGFILE
ln -s /opt/kubectx/kubens /usr/local/bin/kubens &>>$LOGFILE

validate $? "kubens Installation"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

validate $? "Helm Installation"

echo -e "$R Please logout and login again $N"

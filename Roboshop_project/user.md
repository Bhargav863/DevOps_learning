### User
User is a microservice that is responsible for User Logins and Registrations Service in RobotShop e-commerce portal.

Setup NodeJS repos. Vendor is providing a script to setup the repos.

```
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
```
Install NodeJS

```
yum install nodejs -y
```

Configure the application.

Add application User

```
useradd roboshop
```

Lets setup an app directory.

```
mkdir /app
```

Download the application code to created app directory.

```
curl -L -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip
```

```
cd /app 
```
```
unzip /tmp/user.zip
```

Every application is developed by development team will have some common softwares that they use as libraries. This application also have the same way of defined dependencies in the application configuration.

Lets download the dependencies.

```
cd /app 
```
```
npm install 
```

We need to setup a new service in systemd so systemctl can manage this service

Setup SystemD User Service

```
vim /etc/systemd/system/user.service
```

```
[Unit]
Description = User Service
[Service]
User=roboshop
Environment=MONGO=true
Environment=REDIS_HOST=<REDIS-SERVER-IP>
Environment=MONGO_URL="mongodb://<MONGODB-SERVER-IP-ADDRESS>:27017/users"
ExecStart=/bin/node /app/server.js
SyslogIdentifier=user

[Install]
WantedBy=multi-user.target
```

Load the service.

```
systemctl daemon-reload
```

```
systemctl enable user 
```
```
systemctl start user
```

For the application to work fully functional we need to load schema to the Database. Then

**NOTE: Schemas are usually part of application code and developer will provide them as part of development.**

We need to load the schema. To load schema we need to install mongodb client.
To have it installed we can follow below steps
```
mkdir -p ~/mongosh && cd ~/mongosh
curl -LO https://downloads.mongodb.com/compass/mongosh-2.1.5-linux-x64.tgz
tar -xvzf mongosh-2.1.5-linux-x64.tgz
cd mongosh-2.1.5-linux-x64/bin
./mongosh
```
Load Schema

```
cd ~/mongosh/mongosh-2.1.5-linux-x64/bin
./mongosh --host MONGODB-SERVER-IPADDRESS </app/schema/user.js
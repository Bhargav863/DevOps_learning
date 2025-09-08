## We can configure our hosts in the ansible hosts file or else we can use dynamic inventory file in a  path.

Ansible hosts file : /etc/ansible/hosts

We can create a dynamic inventory file like below.

```
192.168.2.1
172.35.36.96

[mongodb]
172.31.42.158

[mongodb:vars]
MONGO_USERNAME=mongodbadmin
MONGO_DB=categories
NAME=Bhargav-inventory

[mysql]
roboshop-us-dev-db-mysql-01.joindevops.online
roboshop-us-dev-db-mysql-02.joindevops.online

[cart]
roboshop-in-prod-app-cart-01.joindevops.online
roboshop-in-prod-app-cart-02.joindevops.online
roboshop-in-prod-app-cart-03.joindevops.online

[user]
roboshop-in-prod-app-user-01.joindevops.online
roboshop-in-prod-app-user-02.joindevops.online

[db:children]
mongodb
mysql

[app:children]
cart
user
```

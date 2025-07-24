## Docker Installtion
Update the installed packages and package cache on your instance.
 
 ```
  sudo yum update -y
 ```
For Amazon Linux 2023, run the following:

```
sudo yum install -y docker
```
Start the docker service
```
sudo systemctl start docker.service
```
Add the user to the docker group
```
usermod -aG docker $USER
```


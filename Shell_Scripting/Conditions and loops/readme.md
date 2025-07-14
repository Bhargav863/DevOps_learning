## Special parameters
* $0--> Name of the script
* $@--> All the arguments passed to the script.
* $#--> Total number of arguments passed to the script.
* $$--> Current process ID of the shell
* $?--> Exit status of the last ran command
## Defining an array inside the shell script
```
persons=("Bhargav" "ram" "Sumati" "Srinu" "Sunil")
```
* Inside array we will always refer values with index and the index starts from zero
* Let's look at an example to understand better.

**Special_params.sh**
```
#!/bin/bash

persons=("Bhargav" "Sumati" "Srinu" "Sunil")

echo "Number of persons are ${#persons[@]}"
echo "The first person is ${persons[0]}"
echo "All persons are ${persons[@]}"

-------------------------------------------------------------------------------
echo "$(date)"
# when you are running system commands with echo, you need to use (). For variable it's not needed.
echo "The exit code of last commad is : $?"

lsl-read
echo "The exit code of last commad is : $?"

echo "The process ID of current shell is $$"

```
## Conditions

```
#!/bin/bash

#Check if the number is greater than 10 or not.

Number=$1

if [ $Number -gt 10 ]; then
    echo "$Number is greater than 10"
elif [ $Number -eq 10 ]; then
    echo "$Number is equal to 10"
else
    echo "$Number is less than 10"
fi
```
## Write a script to install the packages and check if the installation is successful or not.
```
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
```
# Use Functions and improve the script.
* you will keep some code inside functions which is more often repeated, and call whenever you require.
* functions will do some work on behalf of us and it will update what happend.

```
#!/bin/bash

User_id=$(id -u)

if [ User_id -ne 0 ]; then
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
```
* Implement colour coding in the above script if installation failed print in red and if installation is successful print in Green.

```
#!/bin/bash

R="e\[31m"
G="e\[32m"
N="e\[0m"

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Hello, Please run this as a root/sudo user"
fi

Validate() {
    if [ $1 -eq 0 ]; then
        echo -e "$G $2 is installed successfully...$N"
    else
        echo "$R $2 is failed to install...$N"
        exit 1
    fi
}

# $1 & $2 are the arguments to be passed when the function is called.

yum install nginx -y

Validate $? "Nginx"

yum install docker -y

Validate $? "docker"
```
## Push all the images to the dockerhub for future use.
* Step1: Create a docker hub if not have already.
* Step2: Login to the docker hub from terminal
```
docker login -u <username>
```
* It will prompt for the password and enter the password.
* Step3: You need to tag your local image with your Docker Hub username and repository name
```
docker tag app:v1 username/app:v1
```
**Example**
```
docker tag shipping:v1 bhargav863/shipping:v1
```
* Step4: Push the image to the docker hub
```
docker push username/app:v1
```
**EXAMPLE**
```
docker push bhargav863/shipping:v1
``` 
* If you are developing the docker images and some one is using our images. As a image developer if you want to make some rules, you can use ONBUILD.
* ONBUILD will not execute at the time of image built by the developer.
* It will execute when someone is building a Image from that image.
* ONBUILD ADD ... means this instruction will be triggered when another image is built FROM this one.
## Steps to understand better.
### Dockerfile
```
FROM almalinux:8
RUN yum install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
# ONBUILD ADD ... means this instruction will be triggered when another image is built FROM this one.
ONBUILD ADD index.html /usr/share/nginx/html/index.html
CMD [ "nginx", "-g", "daemon off;" ]
```
* Create an image from this docker file.
```
docker build -t onbuild:v1 .
```
* Now create a directory name onbuild-test
```
mkdir onbuild-test && cd onbuild-test
```
* Place your index.html in this path and create another Dockerfile to build an image from onbuild:v1.
### index.html
```
<h1> This is Onbuild Example </h1>
```
### Dockerfile
```
FROM onbuild:v1
```
```
docker build -t onbuild:v2 .
```
* Now run the container from the image and load the content in browser
```
docker run -d -p 8080:80 onbuild:v2
```
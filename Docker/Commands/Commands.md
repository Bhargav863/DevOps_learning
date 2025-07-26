### To list down the images in the server
```
docker images
```
### To download the images from the docker hub
```
docker pull <image_name>
docker pull nginx
```
## How can you create an container from the image.
### Container is the running instance of the image.
```
docker create <image_id/image name>
docker create nginx
```
### To start the container
```
docker start <container_id>
```
### To stop the container
```
docker stop <container_id>
```
### To list the running container
```
docker ps
```
### To list all (running and stopped) containers
```
docker ps -a
```
### To login to the running container
```
docker exec -it <Container_id> bash
docker exec -it 5ba763f03e6c bash
```
### To remove the image
```
docker rmi <image_id>
```
### To remove all the images
```
docker rmi `docker images -a -q`
```
**Note:- To remove the image, the image should not be used any of the container. If the images is used by any of the container. Stop the container and delete the container later remove the image from the host**

### To remove the docker container (First stop the container and remove it)
```
docker rm <container_name/container_id>
```
### To remove all the container at the same time.
```
docker rm `docker ps -a -q`
```
### To pull, create and start the container
```
docker run <image_name>
```
* If image is present on the host, this command will create and start the container from that image.
* if the image is not present on the host, this command will pull the image from the docker hub and create and starts the container.
* docker run = docker pull + docker create + docker start

## port forwading in docker.
```
docker run -p <host_port>:<container_port> <image name>
```
* -p --> port forward. port forward is used to map the host port with the container port.
```
docker run -p 8080:8080 nginx
```
* It runs the container in the foreground. To run it in background you have to use the detached mode option.
## To run the container in detached mode
```
docker run -d -p 8080:8080 nginx
```
* -d --> deatched mode
* This run the container in the background.
## To check the logs of the container
```
docker logs <container_id>
```
## If you want to name your container. 
```
docker run -d -p 8080:80 --name <container_name> <image_name>
```
```
docker run -d -p 8080:80 --name my_web_server nginx
```
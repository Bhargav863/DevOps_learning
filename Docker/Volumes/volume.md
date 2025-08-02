* Docker containers are emphermal in nature, data will be deleted once the container stops or exited.
* Docker containers are best suited for stateless applications because their files systems are emphermal in nature.
* If you DB as a container, by default data will deleted once you deleted the container or the container exited by itself.
* To overcome this situation we can volumes in docker.
* Volumes are persistent data stores for containers, created and managed by Docker.
* There are two types of volumes are there
   1) un-named volumes
   2) Named volumes

## Un-named Volumes

* These are volumes created by Docker automatically when you use a volume mount but don't specify a name.
```
docker run -d -p 8080:8080 -v /usr/share/nginx/html/ cmd:v1
```
* This will create a random volume with name like below
```
60e44d14aa0ea55f1108458b0d3679304c6f498c28c4c392363f6c908d56dd71
```
* you can see this volume by running the docker inspect command
```
docker inspect <container_id>
```
```
"Mounts": [
            {
                "Type": "volume",
                "Name": "60e44d14aa0ea55f1108458b0d3679304c6f498c28c4c392363f6c908d56dd71",
                "Source": "/var/lib/docker/volumes/60e44d14aa0ea55f1108458b0d3679304c6f498c28c4c392363f6c908d56dd71/_data",
                "Destination": "/usr/share/nginx/html",
```
* Mounted to container's /usr/share/nginx/html directory.
* Volume persists after deleting container but it is hard to reuse.

## Bind Mounts

* Another way is that you can create a directory on your host and attach it to the container.
```
mkdir -p /home/user/nginx/data
```
```
docker run -d -p 8080:8080 -v /home/user/nginx/data:/usr/share/nginx/html cmd:v1
```
* /home/user/nginx/data --> path on host
* /usr/share/nginx/html --> path on container
* Create an hello.html inside the container.
```
docker exec -it <cont_id>
```
```
cd /usr/share/nginx/html
```
```
echo "Hello Volumes" > hello.html
```
* Now check on the host, you will see hello.html inside the /home/user/nginx/data.
* Now go to the /nginx/data directory and create an file.
```
echo "Hello world" > helloworld.html
```
* Now check on browser with IP:8080/helloworld.html. You will see the latest content.
* Now remove the container. Still your data exists. You can map this data with the other container.
* Here you have to create the directory and you have to manager the directory.


## Named Volumes
* You explicitly assign a name to the volume. Easier to manage and reuse.
* To list the volumes
```
docker volume ls
```
* Create a volume named nginx
```
docker volume create nginx
```
* Inspect the volume
```
docker volume inspect nginx
```
* Volume will have name and everything can be managed by the docker commands.
```
[root@ip-172-31-28-221 volumes]# docker volume inspect nginx
[
    {
        "CreatedAt": "2025-08-02T10:14:21Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/nginx/_data",
        "Name": "nginx",
        "Options": null,
        "Scope": "local"
    }
]
```
* Now create a container with this volume and check.
```
docker run -d -p 8080:80 -v nginx:/usr/share/nginx/html nginx
```
* Login to the container and create a file under the mounted direcotry
```
docker exec -it <cont_id> bash
```
```
cd /usr/share/nginx/html && echo "Hello volume" > hello.html
```
* You can see the same html file on the host inside the volume
```
ls -lrt /var/lib/docker/volumes/nginx/_data
```
* Now remove the container still you will see the volume.






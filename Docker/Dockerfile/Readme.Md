## What is Dockerfile?
We can create our own docker images by providing the set of instructions in a declarative way through the Dockerfile.
To build an image from the Dockerfile run the below command in the location where docker file is present.
```
docker build -t <imagename>:<version> .
```
Example
```
docker build -t centos:v1 .
```
To run an container from the images
```
docker run <image_name>:<version>/<image_id>
```
Example:
```
docker run -d centos:v1
```
**NOTE: This container will exit immediately because there is no running process inside the container.**
```
docker run -d centos:v1 sleep 30
```
**NOTE: This container will exit after 30 seconds, because there is a running for 30 seconds.**
* When there is no running process inside the container, the container will exit immediately.

## refer to below terminal output
```
[root@ip-172-31-40-115 FROM]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
centos       v1        22773018c042   3 years ago   231MB
[root@ip-172-31-40-115 FROM]# docker run centos:v1
[root@ip-172-31-40-115 FROM]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@ip-172-31-40-115 FROM]# docker ps -a
CONTAINER ID   IMAGE       COMMAND       CREATED         STATUS                     PORTS     NAMES
36164380f62d   centos:v1   "/bin/bash"   8 seconds ago   Exited (0) 7 seconds ago             thirsty_tu
[root@ip-172-31-40-115 FROM]# docker run -d centos:v1 sleep 30
cdc47744fb0660791cb62be4a00eef1b855681c87a420c173ee6726822078b3e
[root@ip-172-31-40-115 FROM]# docker ps
CONTAINER ID   IMAGE       COMMAND      CREATED         STATUS         PORTS     NAMES
cdc47744fb06   centos:v1   "sleep 30"   3 seconds ago   Up 2 seconds             pensive_saha
[root@ip-172-31-40-115 FROM]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@ip-172-31-40-115 FROM]# docker ps -a
CONTAINER ID   IMAGE       COMMAND       CREATED         STATUS                     PORTS     NAMES
cdc47744fb06   centos:v1   "sleep 30"    6 minutes ago   Exited (0) 5 minutes ago             pensive_saha
36164380f62d   centos:v1   "/bin/bash"   7 minutes ago   Exited (0) 7 minutes ago             thirsty_tu
[root@ip-172-31-40-115 FROM]#
```

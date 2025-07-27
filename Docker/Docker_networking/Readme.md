# Docker Networking
* Container networking refers to the ability for containers to connect to and communicate with each other. There are different types of networking.
1) None
2) Bridge (default)
3) Bridge (user defined)
4) Host.

* To list the network 
```
docker network ls
```
```
NETWORK ID     NAME       DRIVER    SCOPE
b3b2b47ad7d5   bridge     bridge    local
abe85f5d3a28   host       host      local
7cca31a313db   none       null      local
```
### None Network
![None.jpg]
* None is a docker network-type where the container is not attached to any network. As a result, the container is unable to communicate with any external network or other containers. It is isolated from every other network.
* You can run an nginx container in a "none" network type using the following command:
```
docker run -d --network none --name my_nginx nginx
```
```
docker inspect <container_id>
```
 "MacAddress": "",
            "Networks": {
                "none": {
                    "IPAMConfig": null,
                    "Links": null,
```

### Bridge Network

## To understand the difference the CMD and ENTRYPOINT follow the below steps.
* Create separete images using both CMD and ENTRYPOINT.
```
docker build -t cmd:v1 .
```
```
docker build -t entry:v1 .
```

* Try to run the containers as shown below from both the Images.
```
docker run -p 80:80 cmd:v1 ping google.com 
```   
```
docker run -p 8080:80 entry:v1 ping google.com
```
* Here we can observe that the container created using the CMD will be able to ping the google and the container created using ENTRYPOINT will throw an error.

```
[root@ip-172-31-28-221 ENTRYPOINT]# docker run -p 80:80 cmd:v1 ping google.com
PING google.com (172.253.62.138) 56(84) bytes of data.
64 bytes from bc-in-f138.1e100.net (172.253.62.138): icmp_seq=1 ttl=105 time=1.56 ms
64 bytes from bc-in-f138.1e100.net (172.253.62.138): icmp_seq=2 ttl=105 time=2.00 ms
64 bytes from bc-in-f138.1e100.net (172.253.62.138): icmp_seq=3 ttl=105 time=1.74 ms
64 bytes from bc-in-f138.1e100.net (172.253.62.138): icmp_seq=4 ttl=105 time=1.58 ms
64 bytes from bc-in-f138.1e100.net (172.253.62.138): icmp_seq=5 ttl=105 time=1.38 ms
^C
--- google.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 1.376/1.651/2.000/0.215 ms
[root@ip-172-31-28-221 ENTRYPOINT]# docker run -p 80:80 entry:v1 ping google.com
nginx: invalid option: "ping"
```
## CMD VS ENTRYPOINT

* CMD command can be overriden by any command from the terminal
* ENTRYPOINT cannot be overriden if you try to do, it will do and append to the entrypoint.
### EXAMPLE DOCKERFILE
```
FROM almalinux:8
ENTRYPOINT [ "ping", "-c5" ]
```
```
docker build -t entry:v2 .
```
```
[root@ip-172-31-28-221 ENTRYPOINT]# docker run entry:v2 google.com
PING google.com (172.253.115.139) 56(84) bytes of data.
64 bytes from bg-in-f139.1e100.net (172.253.115.139): icmp_seq=1 ttl=105 time=1.85 ms
64 bytes from bg-in-f139.1e100.net (172.253.115.139): icmp_seq=2 ttl=105 time=1.97 ms
64 bytes from bg-in-f139.1e100.net (172.253.115.139): icmp_seq=3 ttl=105 time=1.74 ms
64 bytes from bg-in-f139.1e100.net (172.253.115.139): icmp_seq=4 ttl=105 time=2.04 ms
64 bytes from bg-in-f139.1e100.net (172.253.115.139): icmp_seq=5 ttl=105 time=1.79 ms

--- google.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 1.738/1.879/2.041/0.115 ms
```
```
docker run entry:v2 google.com
```
* For best results combine both ENTRYPOINT and CMD. If user is not giving any arguments, CMD can supply the arguments.
```
FROM almalinux:8
CMD [ "google.com" ]
ENTRYPOINT [ "ping", "-c5" ]
```
```
docker build -t entry:v3 .
```
```
docker run entry:v3
```


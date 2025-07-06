### Redis on amazon linux 2023
Redis is used for in-memory data storage(Caching) and allows users to access the data of database over API.
Install the dependencies

```
dnf install -y gcc make jemalloc-devel
```
To have Redis installed we can follow below steps
```
curl -O http://download.redis.io/releases/redis-7.2.4.tar.gz
tar xzf redis-7.2.4.tar.gz
cd redis-7.2.4
make install
```
Update listen address from 127.0.0.1 to 0.0.0.0 in redis.conf and start the redis server 
```
src/redis-server redis.conf --daemonize yes
```



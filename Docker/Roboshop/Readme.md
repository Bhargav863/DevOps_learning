## Steps for the Deployment.
* Go inside the directories and create images for all services.
```
docker build -t catalogue:v1 .
```

```
docker build -t cart:v1 .
```

```
docker build -t mongo:v1 .
```

```
docker build -t user:v1 .
```

```
docker build -t mysql:v1 .
```

```
docker build -t shipping:v1 .
```

```
docker build -t Rabbitmq:v1 .
```

```
docker build -t payment:v1 .
```
```
docker build -t web:v1 .
```
**You can build images in any order, but while creating containers you need to follow dependency order**

## Create a network for our application.
```
docker network create roboshop
```
* Create a Mongodb container as catalouge dependent on MOngodb.
```
docker run -d --name mongodb --network roboshop mongodb:v1
```
* Create catalogue container
```
docker run -d --name catalogue --network roboshop catalogue:v1
```
* Create the redis container using the official image as user is dependent on redis.
```
docker run -d --name redis --network roboshop redis
```
* Create the user container
```
docker run -d --name user --network roboshop user:v1 
```
* Create the cart container
```
docker run -d --name cart --network roboshop cart:v1
```
* Create the Mysql container
```
docker run -d --name mysql --network roboshop mysql:v1
```
* Create shipping container
```
docker run -d --name shipping --network roboshop shipping:v1
```
* create the rabbitmq container
```
docker run -d --name rabbitmq --network roboshop rabbitmq:v1
```
* create the payment container
```
docker run -d --name payment --network roboshop payment:v1
```
* Create the web container
```
docker run -d -p 80:80 --name web --network roboshop web:v1
```
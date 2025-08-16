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
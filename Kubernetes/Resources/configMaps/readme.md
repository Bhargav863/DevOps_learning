* ConfigMaps are API objects used to store non-confidential configuration data in key-value pairs.
* They allow you to decouple configuration from application code, making your apps more portable and easier to manage.
* keep the configuration away from the container.

## Why ConfigMaps?

* Instead of hardcoding configuration (like URLs, environment variables) in container images, you store them in ConfigMaps.
* This makes it easier to update configuration without rebuilding and redeploying the image.

## config-map.yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_NAME: "my-app"
  APP_ENV: "production"
  DB_URL: "mysql://db-service:3306/mydb"
```
## Attach it to the pod as a environment variables.

* Use envFrom to define all configMap's data as a container environment varibales. It can be useful when you need to attach more variables from configmap.

```
apiVersion: v1
kind: Pod
metadata:
  name: configmap-env-pod
spec:
  containers:
    - name: app-container
      image: nginx
      envFrom:
        - configMapRef:
            name: app-config
```
* Here all keys from app-config will become environment variables.

## Attach it to the pod as a individual environment variable

```
apiVersion: v1
kind: pod
metadata:
   name: config-map-env-prod
spec:
  containers:
     - name: app-container
       image: nginx
       env:
         - name: app_name
           valueFrom:
             configMapKeyRef:
                 name: app-config
                 key: APP_NAME
         - name: db_url
           valueFrom:
             configMapKeyRef:
                name: app-config
                key: DB_URL
```



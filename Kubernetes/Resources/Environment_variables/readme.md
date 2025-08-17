* Environment variables allow you to inject dynamic or static configuration into containers running inside Pods.
* They are commonly used to pass configuration data, secrets, or runtime parameters to applications without hardcoding them in the application code or image.

## Types of Environment Variables in Kubernetes

### Static Environment Variables
1) Hardcoded values inside the Pod or Deployment YAML.
2) Best for simple configurations.

## env.yaml

```
apiVersion: v1
kind: pod
metadata:
  - name: env-demo
spec:
  - containers:
      name: env-demo-container
      image: nginx
      env:
        - name: APP_MODE
          value: "testing"
        - name: APP_PORT
          value: "8080"
```

### Dynamic environment variables
1) Values taken from ConfigMaps, Secrets.
2) Useful for environment-specific configs and sensitive data.


* Secrets are objects used to store and manage sensitive information such as passwords, API keys, tokens, or certificates.
* Secrets help keep this data secure and separate from application code and container images.

## Why Use Secrets Instead of Environment Variables in Plaintext?
* Kubernetes encodes Secrets in base64 (not encryption by default, but can be encrypted at rest using KMS).
* They separate configuration from code for better security.
* You can control access using RBAC.
* Easier rotation and updates without rebuilding containers.

## Types of kubernetes secrets
* Opaque (default) – Generic key-value pairs (e.g., API keys, DB passwords).
* docker-registry – Stores Docker registry credentials for pulling private images.
* TLS – Stores TLS certificates and keys for HTTPS communication.
* Service Account Token – Automatically generated for service accounts.

* url --> configMap
* username/password: secret
* To encrypt the secret
  ```
  echo "admin" | base 64
  ```
* To decrypt the secret
  ```
  echo "admin" | base 64 --decode
  ```

## secret.yaml

```
apiVersion: v1
kind: Secret
metadata:
  name: app-secret
type: Opaque
data:
  username: YWRtaW4=        # base64 for "admin"
  password: cGFzczEyMw==    # base64 for "pass123"
```
## Reading secrets into the pod.

## secret-pod.yaml

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
        - name: DB_user
          valueFrom:
            secretKeyRef:
              name: app-secret
              key: username
        - name: DB_pass
          valueFrom:
            secretKeyRef:
              name: app-secret
              key: password
```
* use envFrom to read all the secrets as a container variables.

## secret-pod-all.yaml

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
        - secretRef:
            name: app-secret
```


## Best Practice Tips

* Enable Encryption at Rest in Kubernetes for Secrets (AES-256 via KMS).
* Restrict access with RBAC so only authorized users and service accounts can read secrets.
* Avoid hardcoding secrets in YAML; use kubectl create secret commands or secret management tools like HashiCorp Vault or Sealed Secrets.
* Rotate secrets periodically.
* A ReplicaSet in Kubernetes is a controller that ensures a specified number of Pod replicas are running at any given time. It provides self-healing and scalability for Pods.

## What is Replicaset?
* A replica set ensures that always N number of pods are running.
* If a Pod fails or is deleted, the ReplicaSet automatically creates a new one to maintain the desired count.
* It uses Labels and Selectors to identify which Pods it manages.

## Key features
* Maintains the desired number of pods.
* Supports scaling. Increase/decrease number of pods by modifying replica values.
* Uses Lable selectors. Match pods using labels

## Limitations
* Doesn't support the rolling updates directly.
* For example, I have updated my image in the replicaset yaml file, applied it to the replicaset. Later observe the pods, you can see the olds pods only, new pods won't be created. That means the updated didn't applied to the pods.

* Rolling updates are supported by deployment.

## replicaset.yaml

```
apiVersion: v1
kind: ReplicaSet
metadata:
  name: sample-pod
  labels: # These labels are replicaset labels, every k8 resource should have lables.
    environment: dev
    app: frontend
spec:
  replicas: 3 # specifies the number of pods to be created
  selector:
    matchLabels: # these labels should match pod lables.
      environment: dev
      tier: frontend
      app: nginx
  template: # template nothing but the pod definiton
    metadata:
      labels: # these are the pod labels.
        environment: dev
        tier: frontend
        app: nginx
  spec:
    containers:
      - image: nginx
        name: sample-nginx
        ports:
          - containerPort: 80
```
* To create replicaset.
  ```
  kubectl apply -f replicaset.yaml
  ```
  ```
  kubectl get pods
  ```
  ```
  kubectl get replicaset
  ```
* You can try delete the pods, the pods will recreate automatically.

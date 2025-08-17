* A Deployment in Kubernetes is a higher-level abstraction that manages ReplicaSets and provides declarative updates for Pods and ReplicaSets

## What is Deployment?
* A Deployment ensures that a specified number of Pods are running at any given time, and it can:
  1) Create new ReplicaSets
  2) Scale the number of Pods up or down
  3) Perform rolling updates and rollbacks
  4) Maintain the desired application state even if nodes or Pods fail
* Deployment = declarative way to manage Pods via ReplicaSets.
* Replicaset is the subset of deployment. A replicaset will be created whenever a deployment is created.

## key features of deployment
* Declarative updates : 
  1) You define your desired state in a YAML/JSON manifest (e.g., 3 replicas of a certain container image), and Kubernetes ensures the actual state matches the desired state.
* Rolling updates
  1) Updates the Pods gradually (not all at once) to avoid downtime.
  2) For example, when you updated the deployment, the deployment will create a new replicaset. It will create a pod in new replicaset and delete a pod from the old replicaset after creation of new pod. In this way we can acheive minimal downtime.
* selfhealing
  1) whenever a pod crashes, deployment will automatically creates new pod to maintain the desired number of pods.
* Rollback 
  1) If something goes wrong during an update, you can rollback to a previous version using:
    ```
    kubectl rollout undo deployment <deployment-name>
    ```
* Scalability
  1) You can scale the number of replicas easily:
     ```
     kubectl scale deployment <name> --replicas=5
     ```

## deployment.yaml

```
apiVersion: v1
kind: Deployment 
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

* To create the deployment from this file
  ```
  kubectl apply -f deployment.yaml
  ```
  ```
  kubectl get pods
  ```
* You can check a new replicaset will be created for this deployment
  ```
  kubectl get replicaset
  ```
* when you updated the deployment, this replica set will delete and a new one will be created.
  ```
  kubectl get replicaset
  ```

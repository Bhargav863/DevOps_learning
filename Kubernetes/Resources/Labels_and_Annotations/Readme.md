## What are labels and Annotations in kubernetes.
* Kubernetes allows you to attach metadata to objects like Pods, Deployments, Services, ConfigMaps, Nodes, etc.
* Two key ways to add metadata:
   1) Labels → Key-value pairs used for identifying, organizing, and selecting Kubernetes objects. It is used for filtering the resources.
   2) Annotations → Key-value pairs used for storing arbitrary, non-identifying metadata (not for selection).
## Labels
* Labels are key-value pairs attached to kubernetes objects.
* **purpose:** Used to identify and oragnize resources.
* **Key Feature:** Labels are selectable — you can filter resources using label selectors (kubectl get pods -l app=nginx).

**Common Usecases**
* Grouping resources by application (e.g., app=frontend).
* Environment tagging (e.g., env=production, env=dev).
* Version control for rolling updates (e.g., version=v1).
* Service discovery (e.g., Services use labels to select pods).

## label.yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-labeled
  labels:
    app: nginx
    tier: frontend
    env: dev
spec:
  containers:
    - name: nginx
      image: nginx:latest
```
```
kubectl apply -f lable.yaml
```
```
kubectl get pods -l app=nginx
```
```
kubectl get pods -l env=dev
```

## Annotations
* Annotations are also key-value pairs attached to Kubernetes objects, but for storing metadata.
* **Purpose:** Used for information that tools, libraries, or humans need, not for selecting resources.
* **Key Feature:** Annotations cannot be used for selecting objects.

**Common Use cases**
* Adding build/version info (e.g., build: "jenkins-job-122").
* Storing contact info (e.g., owner: "devops-team@example.com").
* Adding URLs for dashboards or documentation.
* Storing checksums for configuration for automated rollouts.
* Used by tools like Prometheus, Istio, Linkerd for configs. 

## annotation.yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-annotated
  annotations:
    description: "This pod runs the NGINX web server"
    owner: "devops-team@example.com"
    buildNumber: "jenkins-123"
    documentation: "https://internal-docs.example.com/nginx"
spec:
  containers:
    - name: nginx
      image: nginx:latest
```
```
kubectl apply -f annotation.yaml
```
```
kubectl describe pod nginx-annotated
```
## Difference Between Labels And Annotations
* Kubernetes Labels and Kubernetes Annotations are used to add the metadata to our Kubernetes objects. But there is a difference between both of them. Kubernetes Labels allow us to do a grouping of our objects so that we can perform queries for viewing and operating.

* Kubernetes Annotations are used for adding non-identifying metadata to Kubernetes objects. This metadata information is only for the user. Annotations can hold any kind of information that is useful and can provide context to DevOps teams. Examples include phone numbers of persons responsible for the object or tool information for debugging purposes.
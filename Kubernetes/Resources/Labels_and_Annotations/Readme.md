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
* Namespaces in kubernetes re logical partitions within a cluster that allows you to group and isolate resources likes pods, deployments, replicasets and services etc.,
* Namespaces are like separate workspaces inside the same cluster.
* Namespaces are especially useful when managing large scale systems involving multiple teams,projects or environments.
* If you won't use namespace, by default kubernetes will use the default namespace.

* To create a namespace via cli
  ```
  kubectl create namespace <namespace_name>
  ```
* To delte a namespace
  ```
  kubectl delete namespace <namespace_name>
  ```
* To list all the namespaces
  ```
  kubectl get ns
  ```
* How to check what is my default namespace or current namespace
   ```
   kubectl config get-context
   ```
* How to set namespace in config file without open the config file directly?
  ```
  kubectl config set-context --current --namespace=<new_namespace>
  ```
* verify the change.
  ```
  kubectl config get-context
  ``` 

* Namespaces can be created through the manifest file as well.
  ```
  apiVersion: v1
  kind: Namespace
  metadata:
    name: roboshop
  ```
## Namespace dependent resources vs namespace independent resources
* Not all the resources are tied to the namespace. To figure out which are namespace dependent, you can run the below command.
  ```
  kubectl api-resources
  ```
* You can see true for namespace dependent resource and false for namespace independent resource.
* Before creating any resources, first check is it namespace dependent or not. If it is depenedent you need to mention the namespace explicitly while creating the resource or otherwise the resource will be created in default namespace.

* Daemonset ensures one pod will run on every node of the cluster.
* If you run daemonset, kubernetes will create a pod in each and every node.
* If a node is removed from the cluster, daemonset will remove the pod.
* If a node is added to the cluster, daemonset will create a new pod on the new node added.
* Optionally, you can restrict it to specific nodes using node selectors or node affinity.
* It is used for node-level tasks.

## UseCases
* It can used in the Logging and monitoring of nodes.
* you can deploy logging agents like filebeat,fluentd and montioring agents like newrelic,prometheus using this daemonsets.

* Create the daemonset by applying the manifest 01-daemonset.yaml
  ```
  kubectl apply -f 01-daemonset.yaml
  ```
* You will see 3 pods created and also observe the IP addresses of the nodes that where pods are created. you will see each node will have one pod.
  ```
  kubectl get pods -o wide
  ```
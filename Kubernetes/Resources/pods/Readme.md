* Pods are the smallest deployable units that you can create and manage in kubernetes.
* A pod represents the single instance of running process in your cluster.
* A pod is group of one or more containers, with shared storage and network resources. All containers within a pod will share the same storage and network.
* Pods are ephermal in nature, they can be created, deleted and updated.
![pod](pod.jpg)
* Each pod gets the unique Ipaddress.
* Containers inside pod connect using local host network on different ports.
* Containers running inside a pod should have different port numbers to avoid port clashes.
* Containers inside a pod share the same volume mount.
* All the containers inside a pod are scheduled on the same node; It cannot span multiple nodes.

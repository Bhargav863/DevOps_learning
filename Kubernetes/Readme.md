## What is kubernetes?
* Kubernetes is an opensource container orchestartion platform that automates the container deployment, scaling and loadbalancing.

## Cloud based kubernetes services
* Google kubernetes Engine by GCP (GKE)
* Elastic kubernetes service by AWS (EKS)
* Azure kubernetes service by Azure (AKS)

## Installation tools
* Minikube installation for single node cluster.
* kube-adm/kops installtion for multinode clusters.

## We have seen many problems with docker, How kubernetes solves this problems?
* Kubernetes have cluster architecture.(Clustering any number of containers running on different workloads).
* Kubernetes supports the autoscaling and autohealing. 
* kubernetes supports load balancing
* Tls/ssl certificate support.
* Health monitoring of the containers.
* Kubernetes provides roll back option.Going back to previous version.

* K8s follows cluster architecture.
* master --> Only gives instructions
* Worker nodes --> will do the work given by master.
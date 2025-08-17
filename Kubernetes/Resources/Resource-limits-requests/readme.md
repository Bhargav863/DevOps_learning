## Resources
* One of the main advantage of the docker over VM is Resource utilization. VM will block the resources completely while docker dynamically consume the resources and didn't block the system resources.
* There is no limits for the container, if there is code defect there may be a chance that container will block the whole system resouces.
* To comeout of this problem we can implement resource management in K8s.
* When you specify a Pod, you can optionally specify how much of each resource a container needs. The most common resources to specify are CPU and memory (RAM).
* Resource limits in Kubernetes control how much CPU and memory a container (or Pod) can request and use within a cluster. They ensure fair resource allocation, prevent resource starvation, and improve cluster stability.
## Key Terms
* **Requests:** Minimum amount of CPU/memory guaranteed for a container.
  ```
  requests: #softlimit
      memory: "64mi"
      cpu: "250m"
  ```
* **Limits:**  Maximum amount of CPU/memory a container can use.
  ```
  limits: #hardlimit
    memory: "128mi"
    cpu: "500m"
  ```
* CPU is measured in millicores (m):
    1) 1cpu = 1000m
    2) 500m = 0.5cpu
* Memory is measured in bytes (with units like Mi, Gi):
   1) 128Mi = 128 Mebibytes

## Why are Resource Limits Important?
* Prevents a noisy neighbor problem: One container doesn’t hog all CPU/memory and crash other apps.
* Predictable performance: Requests help Kubernetes schedule pods on suitable nodes.
* Avoids OOM kills: If a container exceeds memory limit → it gets killed.
* Helps in cost optimization: Avoid over-provisioning resources.

## How kubernetes uses Requests and limits
* Scheduler uses requests to decide where to place the Pod.
* Kubelet enforces limits during runtime.

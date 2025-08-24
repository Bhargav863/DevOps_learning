## What is helm?
Helm is a package manager for Kubernetes (similar to apt for Ubuntu or yum for CentOS). It simplifies the process of deploying, managing, and upgrading applications on Kubernetes.

Without Helm: You need to manually write multiple YAML manifests (Deployment, Service, Ingress, ConfigMap, etc.), apply them using kubectl, and maintain them.

With Helm: You package all these manifests into a Helm Chart, making installation and upgrades as easy as:
```
helm install my-app ./my-chart
```

Let's take the catalogue manifest as an example from k8-roboshop project.

Here what will change frequently, if you deploy it across different environments.
  1) image --> Image version will keep on changing.
  2) Namespace --> namespace will change based on env (prod,staging)
  3) ReplicaCount --> replica count may change.
How helm helps in this scenario
  1) We will keep the main files aside and edit the required files.
  2) Parameterizes values → No manual YAML edits. Without touching mainfiles, we will send parameters.
  3) Supports multi-environment configs via values.yaml.
  4) Provides easy upgrade & rollback:
     ```
     helm upgrade catalogue ./mychart --set image.tag=1.0.1
     ```
**Purpose of helm is for 2 things**
1) Parameterize the kubernetes manifest files.
2) It acts as kubernetes package manager.

**Charts**

Helm uses a packaging format called charts. A chart is a collection of files that describe a related set of Kubernetes resources. 
A chart is organized as a collection of files inside of a directory. 

```
  Chart.yaml          # A YAML file containing information about the chart
  LICENSE             # OPTIONAL: A plain text file containing the license for the chart
  README.md           # OPTIONAL: A human-readable README file
  values.yaml         # The default configuration values for this chart
  values.schema.json  # OPTIONAL: A JSON Schema for imposing a structure on the values.yaml file
  charts/             # A directory containing any charts upon which this chart depends.
  crds/               # Custom Resource Definitions
  templates/          # A directory of templates that, when combined with values,
                      # will generate valid Kubernetes manifest files.
  templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes
```

To list the charts
```
helm list
```

## Helm as a kubernetes package manager

1) In general, to install a package. We will run 
      yum install nginx -y
      It will fecth the nginx package from internet and install it on our server.
2) In kubernetes, if you need to know
     How to create a image and how to push it.
     You need to know how to run the manifest
3) I want to install efs drivers to my k8s cluster
   * Image should be available --> Images are available in internet
   * You should know to how to run the manifest
4) Using helm, you will add the repo in your local install it.
   ```
   helm repo add <url>
   helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver/
   ```
   ```
   helm repo update
   ```
   Install a release of the driver using the Helm chart.
   ```
   helm upgrade --install aws-efs-csi-driver --namespace kube-system aws-efs-csi-driver/aws-efs-csi-driver
   ```
5) Using helm you can install any 3rd party applications into your kubernetes cluster.


     
     

     
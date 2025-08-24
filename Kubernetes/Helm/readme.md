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

     

     
* In EFS, even though you are using dynamic, you have to create the file system in AWS EFS.
* Create the EFS file system.
* Edit the security Group to allow access.
* Install drivers 
  ```
  kubectl kustomize     "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/ecr/?ref=release-2.1" > private-ecr-driver.yaml
  ```
* In the following command, replace region-code with the AWS Region that your cluster is in and run the command.
  ```
  sed -i.bak -e 's|us-east-1|region-code|' private-ecr-driver.yaml
  ```
* Now apply the manifest.
  ```
  kubectl apply -f private-ecr-driver.yaml
  ```
* check the installation, you see the pods running with efs-drivers.
  ```
  kubectl get pods -n kube-system
  ```

* Make sure that EC2 will acess the EFS. Attach the policy "AmazonElasticFileSystemClientReadWriteAccess" to the EC2 IAM role.
* A single file system can be used for entire company. Under that i can create a storage class for every project.
* you will get an accesspoint inside efs for every project.
* There can be many folders/files inside the access point.

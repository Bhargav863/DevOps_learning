* Create the EFS file system.
* Edit the security group created along with the file system to allow traffic.
* Install EFS-CSI drivers.
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
* Create PV,PVC and mount to the pod.
  ```
  kubectl apply -f efs-static.yaml
  ```
* Now check ebs will be attached and increases the storage to the mentioned GB.
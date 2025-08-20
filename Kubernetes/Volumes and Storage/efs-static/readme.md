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
* You can see storage is attached and it will grow as the files keep on writing to that
```
ubuntu@ip-172-31-90-143:~/DevOps_learning/Kubernetes/Volumes and Storage/efs-static$ kubectl exec -it nginx-deployment-6786c9b9b6-nns9q -- /bin/bash
root@nginx-deployment-6786c9b9b6-nns9q:/# df -hT
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   80G  5.5G   75G   7% /
tmpfs          tmpfs     64M     0   64M   0% /dev
/dev/nvme0n1p1 xfs       80G  5.5G   75G   7% /etc/hosts
shm            tmpfs     64M     0   64M   0% /dev/shm
127.0.0.1:/    nfs4     8.0E     0  8.0E   0% /usr/var/share/nginx/html
tmpfs          tmpfs    7.0G   12K  7.0G   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs          tmpfs    3.9G     0  3.9G   0% /proc/acpi
tmpfs          tmpfs    3.9G     0  3.9G   0% /sys/firmware
root@nginx-deployment-6786c9b9b6-nns9q:/#
```
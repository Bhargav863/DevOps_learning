* In dynamic creation of disk and PV handled by kubernetes.
* Storage class will create disk and pv automatically. It is a admin task.

Workaround in dynamic is
1) Install aws-ebs-csi drivers because storage class use drivers to create the disk.
2) Instances should have the ebs full access.
   
   ```
   kubectl apply -f ebs-dynamic.yaml
   ```
3) You can see in AWS a ebs will be created and status is "In use" once the pod is scheduled.

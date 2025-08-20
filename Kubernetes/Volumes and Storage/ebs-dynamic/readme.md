* In dynamic creation of disk and PV handled by kubernetes.
* Storage class will create disk and pv automatically. It is a admin task.

Workaround in dynamic is
1) Install aws-ebs-csi drivers because storage class use drivers to create the disk.
2) Instances should have the ebs full access.
   
   ```
   kubectl apply -f ebs-dynamic.yaml
   ```
3) You can see in AWS a ebs will be created and status is "In use" once the pod is scheduled.
4) Login to the pod and check a volume will be mounted.
   ```
   kubectl exec -it nginx-deployment-7b6956c67f-fgv8q -- bash
   ```
   ```
   root@nginx-deployment-7b6956c67f-fgv8q:/# df -hT
   Filesystem     Type     Size  Used Avail Use% Mounted on
   overlay        overlay   80G  5.2G   75G   7% /
   tmpfs          tmpfs     64M     0   64M   0% /dev
   /dev/nvme0n1p1 xfs       80G  5.2G   75G   7% /etc/hosts
   shm            tmpfs     64M     0   64M   0% /dev/shm
   /dev/nvme1n1   xfs      5.0G   68M  4.9G   2% /usr/var/share/nginx/html
   tmpfs          tmpfs    7.0G   12K  7.0G   1% /run/secrets/kubernetes.io/serviceaccount
   tmpfs          tmpfs    3.9G     0  3.9G   0% /proc/acpi
   tmpfs          tmpfs    3.9G     0  3.9G   0% /sys/firmware
   root@nginx-deployment-7b6956c67f-fgv8q:/#
   ```


* Create the EBS volume in the AWS.
* Install the EKS_EBS CSI driver
  ```
  kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.27"
  ```
* Make sure that EC2 is able to access the EBS. Modify the IAM role. Add the Amazon EC2fullaccess role to the EC2 IAM role attached.
* Create a PV - physical represntation of EBS volume inside your cluster.
* Create PVC - a way of claiming storage.
* Define the pod/deployment and mount the volume and apply it.
  ```
  kubectl apply -f ebs-static.yaml
  ```
* Login to and pod and observer below.
```
root@nginx-deployment-7bf8f57466-24vv6:/# df -hT
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   80G  5.2G   75G   7% /
tmpfs          tmpfs     64M     0   64M   0% /dev
/dev/nvme0n1p1 xfs       80G  5.2G   75G   7% /etc/hosts
shm            tmpfs     64M     0   64M   0% /dev/shm
/dev/nvme1n1   ext4      30G   24K   30G   1% /usr/var/share/nginx/html
tmpfs          tmpfs    7.0G   12K  7.0G   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs          tmpfs    3.9G     0  3.9G   0% /proc/acpi
tmpfs          tmpfs    3.9G     0  3.9G   0% /sys/firmware
root@nginx-deployment-7bf8f57466-24vv6:/# cd /usr/share/nginx/html
root@nginx-deployment-7bf8f57466-24vv6:/usr/share/nginx/html# ls -lrt
total 8
-rw-r--r--. 1 root root 612 Dec  4  2018 index.html
-rw-r--r--. 1 root root 537 Dec  4  2018 50x.html
root@nginx-deployment-7bf8f57466-24vv6:/usr/share/nginx/html# echo "<h1> Hello Volumes </h1>" > Hello.txt
root@nginx-deployment-7bf8f57466-24vv6:/usr/share/nginx/html# ls -lrt
total 12
-rw-r--r--. 1 root root 612 Dec  4  2018 index.html
-rw-r--r--. 1 root root 537 Dec  4  2018 50x.html
-rw-r--r--. 1 root root  25 Aug 20 14:26 Hello.txt
root@nginx-deployment-7bf8f57466-24vv6:/usr/share/nginx/html# exit
```
* Now try to add one more replica, you will get error because of the access mode as i used read write once. 
```
Warning  FailedAttachVolume  52s   attachdetach-controller  Multi-Attach error for volume "ebs-static" Volume is already used by pod(s) nginx-deployment-7bf8f57466-24vv6
```
For example, I have 3 worker nodes and I asked for 10 pods out of 10 pods 3 went to one server,those are created because that server got access to EBS volume. I used access mode as ReadWriteOnce,i.e volume can be accessed by a single node at a time, but it can be accessed by multiple pods if pods are on some node.

Check EBS in AWS, you will see it is in use.


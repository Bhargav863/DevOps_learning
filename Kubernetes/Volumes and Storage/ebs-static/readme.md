* Create the EBS volume in the AWS.
* Install the EKS_EBS CSI driver
  ```
  kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.27"
  ```
* Make sure that EC2 is able to access the EBS. Modify the IAM role. Add the Amazon EC2fullaccess role to the EC2 IAM role attached.
* Create a PV - physical represntation of EBS volume inside your cluster.
* Create PVC - a way of claiming storage.


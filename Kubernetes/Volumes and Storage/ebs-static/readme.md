* Create the EBS volume in the AWS.
* Install the EKS_EBS CSI driver
  ```
  kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.48"
  ```
* Create a PV.
  ```
  
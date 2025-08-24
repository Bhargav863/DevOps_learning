Deploy the application app1 the AWS EKS with the service type cluster IP.
```
kubectl apply -f manifest.yaml
```
Create IAM OIDC provider for your cluster
```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster eks-spot-cluster \
    --approve
```

Install the AWS Load Balancer Controller

**Reference: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html**

1) Download an IAM policy for the AWS Load Balancer Controller that allows it to make calls to AWS APIs on your behalf.
   ```
   curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.13.3/docs/install/iam_policy.json
   ```
2) Create an IAM policy using the policy downloaded in the previous step.
   ```
   aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
   ```
3) Replace the values for cluster name, region code, and account ID.
   ```
   eksctl create iamserviceaccount \
    --cluster=<cluster-name> \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=arn:aws:iam::<AWS_ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --region <aws-region-code> \
    --approve
   ```
4) Add the eks-charts Helm chart repository.
   ```
   helm repo add eks https://aws.github.io/eks-charts
   ```
5) Update your local repo to make sure that you have the most recent charts.
   ```
   helm repo update eks
   ```
6) Install the AWS Load Balancer Controller.
```
   helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=my-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --version 1.13.0
```
7) Verify the controller is installed. You will see controller pods running.
   ```
   kubectl get deployment -n kube-system aws-load-balancer-controller
   ```

Create an ingress resource for ALB, refer to ingress.yaml

```
kubectl apply -f ingress.yaml
```

Note:
Check ALB will be created in your AWS account.
Check the target groups are registered or not. 
Load the url in the browser. In this case app1.devopslearner.space.

Follow the same steps for app2 and observer it uses the same ALB, like that we can attach single ALB to any number of projects.

R53 --> ALB --> Ingress --> Service --> pod (traffic flow)

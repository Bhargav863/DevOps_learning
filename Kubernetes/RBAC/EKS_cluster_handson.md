As a EKS admin create the namespace.
```
kubectl create namespace roboshop
```

IAM for Authentication
RBAC for authorization

If it is on-prem cluster you will get both authorization and authentication from Kubernetes cluster itself. But in EKS they will use IAM for authentication.

You need to have the IAM user for authentication and need to map with K8-RBAC for authorization.

**Step1:** Create an user in IAM and this user should have access to user cluster.
1) This IAM user sholud describe the cluster.
2) While creating user attach the policy only to describe the cluster.
3) Create the policy
   IAM -> policies -> Create Policy 
   * select a service - EKS
   * Actions Allowed --> Expand Read and select describe cluster.
   * Resources -> add arn --> add your cluster arn here 
   * Next -> give a name for policy and create.
   * check policy created and the actions allowed.
4) create the IAM user and attach this policy.

**Step2:** Create a role and rolebinding in the cluster.
  1) Refer to admin.yaml for manifest
    ```
    kubectl apply -f admin.yaml
    ```
**Step3:** You need to inform the EKS cluster about the user, this can be done by using aws-auth configmap which is in kube-system namespace.

Whenever a eks cluster is created, there is a configMAP aws-auth will create in kube-system namespace. Here we need to map IAM user and k8-RBAC
   1) You can check by running the below command
      ```
      kubectl get configMap -n kube-system
      ```
   2) Get the configMap yaml by running below command
      ```
      kubectl get configMap aws-auth -n kube-system -o yaml
      ``` 
## Edit configMap with the eksctl

1) View the current mappings in the ConfigMap. Replace my-cluster with the name of your cluster. Replace region-code with the AWS Region that your cluster is in.
   ```
   eksctl get iamidentitymapping --cluster my-cluster --region=region-code
   ```
2) Add a mapping for a user. IAM best practices recommend that you grant permissions to roles instead of users. Replace my-user with your user name. Replace eks-console-dashboard-restricted-access-group with the name of the group specified in your Kubernetes RoleBinding or ClusterRoleBinding object. Replace 111122223333 with your account ID. You can replace my-user with any name you choose.
   ```
   eksctl create iamidentitymapping --cluster my-cluster --region=region-code \
    --arn arn:aws:iam::111122223333:user/my-user --username my-user --group eks-console-dashboard-restricted-access-group \
    --no-duplicate-arns
    ```
    ```
    eksctl create iamidentitymapping --cluster eks-spot-cluster --region=us-east-1    --arn arn:aws:iam::851725611857:user/Bhargav --username Bhargav --group roboshop-admin --no-duplicate-arns
    ```
**Refer to: https://docs.aws.amazon.com/eks/latest/userguide/auth-configmap.html**

## How to test this role?

1) Create an AWS access keys for the user created.
2) Configure the user by running aws configure on your workstation.
3) verify by running below commmand
   ```
   aws sts get-caller-identity
   ```
4) Create the kubeconfig now for that user
   ```
5) Now try to list the pods it will work.
6) Try to delete the pods, you will be able to delete.
7) try to list the nodes, you will get forbidden error because nodes is cluster level resource.
   ```
    ubuntu@ip-172-31-93-79:~$ kubectl get nodes
    Error from server (Forbidden): nodes is forbidden: User "Bhargav" cannot list resource "nodes" in API group "" at the cluster scope
    ubuntu@ip-172-31-93-79:~$
   ```
## Provide the limited access for the cluster using cluster role and cluster rolebinding

1) Refer to admin.yaml for the manifests.
2) Login as the cluster admin using aws configure.
3) Apply the manifest
   ```
   kubectl apply -f admin.yaml
   ```
4) Now, for testing purpose login as the user by running aws configure.
5) List the nodes, you will be able to see the nodes.
6) List the namespaces, you will be able to see.
   

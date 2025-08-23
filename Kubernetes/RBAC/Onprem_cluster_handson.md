To test RBAC we need to a user, so first create a new user. Below is the step-by-step guide to creating a new user named **tony** in a Kubernetes cluster

**Step1: Generate Certificates for the User**

 1) Generate a private key for **tony** using RSA algorithm (4096 bits):
    ```
    openssl genrsa -out tony.pem
    ```
 2) Create a Certificate Signing Request (CSR) for tony
    ```
    openssl req -new -key tony.pem -out tony.csr -subj "/CN=tony"
    ```
 3) Obtain the base64-encoded representation of the CSR:
    ```
    cat tony.csr | base64 | tr -d "\n"
    ```
 4) Use the output to create a CertificateSigningRequest resource:
    ```
    cat <<EOF | kubectl apply -f -
    apiVersion: certificates.k8s.io/v1
    kind: CertificateSigningRequest
    metadata:
      name: tony
    spec:
      request: <base64_encoded_csr>
      signerName: kubernetes.io/kube-apiserver-client
      expirationSeconds: 86400  # one day
      usages:
        - digital signature
        - key encipherment
        - client auth
    EOF
    ```
 5) csr status
    ```
    kubectl get csr
    ```
**Step 2: Sign the Certificate Using the Cluster Certificate Authority** 

  1) Approve the CertificateSigningRequest for tony:
     ```
     kubectl certificate approve tony
     ```
  2) Check the CSR status:
     ```
     kubectl describe csr/tony
     ```
**Step 3: Create a Configuration Specific to the User**
  1) Extract the signed certificate from the CertificateSigningRequest:
     ```
     kubectl get csr/tony -o jsonpath="{.status.certificate}" | base64 -d > tony.crt
     ```
  2) Use the kubectl config set-cluster command to set up the cluster information:
     ```
     kubectl --kubeconfig ~/.kube/config-tony config set-cluster preprod --insecure-skip-tls-verify=true --server=https://KUBERNETES-API-ADDRESS
     ```
     Replace KUBERNETES-API-ADDRESS with the actual API server address of your Kubernetes cluster.
  3) set user credentials: Use the kubectl config set-credentials command to set up the user credentials:
     ```
     kubectl --kubeconfig ~/.kube/config-tony config set-credentials tony --client-certificate=tony-user.crt --client-key=tony.pem --embed-certs=true
     ```
     Replace tony-user.crt and tony.pem with the paths to your user certificate and private key files respectively.
  4) Use the kubectl config set-context command to set up the context information:
     ```
     kubectl --kubeconfig ~/.kube/config-tony config set-context default --cluster=preprod --user=tony
     ```
  5) Finally, use the kubectl config use-context command to use the newly created context:
     ```
     kubectl --kubeconfig ~/.kube/config-tony config use-context default
     ```
  6) Now, your config-tony file is configured with the necessary cluster, user, and context information. You can use it with kubectl commands by passing --kubeconfig ~/.kube/config-tony. Make sure to replace placeholder values with your actual configuration details.
     ```
     kubectl --kubeconfig ~/.kube/config-tony get pods
     ```
  7) We’ve successfully created a new user named “tony”. However, when we try to access the pods using this user, we encounter a Forbidden error: 
    This error occurs because we haven’t assigned any permissions to the “tony” user yet; we’ve only created the user.

Now, let’s proceed to create new roles and role bindings and associate them with the “tony” user using the following steps.

Let’s create RBAC rules and apply to the above user:
**Example 1: Allow read-only access to pods in specific namespace**
  1) Create a file named pod-reader-role.yaml with the following content:
        ```
        apiVersion: rbac.authorization.k8s.io/v1
        kind: Role
        metadata:
        namespace: kube-system
        name: pod-reader
        rules:
         - apiGroups: [""]
           resources: ["pods"]
           verbs: ["get", "list"]
        ```
  2) Apply the role
     ```
     kubectl apply -f pod-reader-role.yaml
     ```
     This Role allows getting and listing pods in the kube-system namespace.
  3) Create a file named tony-pod-reader-rolebinding.yaml with the following content:
        ```
        apiVersion: rbac.authorization.k8s.io/v1
        kind: RoleBinding
        metadata:
            name: tony-pod-reader
            namespace: kube-system
        subjects:
          - kind: User
            name: tony
            apiGroup: rbac.authorization.k8s.io
        roleRef:
            kind: Role
            name: pod-reader
            apiGroup: rbac.authorization.k8s.io
        ```
  4) Apply the rolebinding
     ```
     kubectl apply -f tony-pod-reader-rolebinding.yaml
     ```
This RoleBinding binds the “tony” user to the “pod-reader” Role in the kube-system namespace.
Now, the “tony” user should be able to list and get pods in the kube-system namespace using the provided kubeconfig i.e., ~/.kube/config-tony.
We’ve set up a new role and role binding for the user “tony”. Now, let’s try accessing the pods in the kube-system namespace with the following command.

 ```
 kubectl --kubeconfig ~/.kube/config-tony get pods -n kube-system
 ```
 We’ve successfully listed the pods in the kube-system namespace. However, if you attempt to view the nodes inside the cluster, you’ll receive a Forbidden error.

**Example 2: Allow access view the nodes in the cluster**
  1) Create a file named node-list-clusterrole.yaml with the following content:
    ```
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRole
    metadata:
    # "namespace" omitted since ClusterRoles are not namespaced
      name: node-list-clusterrole
    rules:
     - apiGroups: ["v1","apps/v1",""]
       resources: ["secrets","nodes","namespaces","persistentvolumes","deployments"] # here i am providing some extra access.
       verbs: ["get", "watch", "list"]
    ```
 2) Apply the cluster role
    ```
    kubectl apply -f node-list-clusterrole.yaml
    ```
 3) Create a file named tony-node-lister-clusterrolebinding.yaml with the following content:
    ```
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRoleBinding
    metadata:
      name: tony-node-lister-clusterrolebinding
    subjects:
      - kind: User
        name: tony # Name is case sensitive
        apiGroup: rbac.authorization.k8s.io
    roleRef:
        kind: ClusterRole
        name: node-list-clusterrole
        apiGroup: rbac.authorization.k8s.io
 4) Apply the manifest
    ```
    kubectl apply -f tony-node-lister-clusterrolebinding.yaml
    ```
Now list the nodes in the cluster
```
kubectl --kubeconfig ~/.kube/config-tony get nodes
```
We’ve successfully listed the nodes in all namespaces. However, if you attempt to access other resources(other than pods) in any namespace, you’ll receive a Forbidden error.

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

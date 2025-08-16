**STEP:1** 
## Install the kubectl on server.
* Download the latest release
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
* Download the kubectl checksum file:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```
* Validate the kubectl binary against the checksum file:
```
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```
* Install kubectl
```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
* Test the kubectl version
```
kubectl version --client
```
**STEP2**
## Install docker on the server
* Use docker.sh script to install docker.

**STEP3**
## Install minikube on server.
* To install the latest minikube stable release on x86-64 Linux using Debian package:
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```
* start your cluster
```
minikube start
```
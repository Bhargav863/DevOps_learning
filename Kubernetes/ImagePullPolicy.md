* ImagePullPolicy in Kubernetes defines when and how the container image should be pulled from the container registry (like Docker Hub, ECR, GCR, etc.). It’s part of the container spec inside a Pod or Deployment manifest.

**Available values of image pull policy**
## Always
1) The image is pulled every time the Pod is started or restarted, regardless of whether the image exists locally.

2) **Use Case:** Ensures you always get the latest version of an image, especially for tags like latest or during development.
3) **Downside:** Extra network calls, slower Pod startup, and higher bandwidth usage.

## IfNotPresent (default for tags other than latest)
1) The image is pulled only if it is not already present on the node.
2) **Use Case:** Saves bandwidth and speeds up Pod start when images are already cached.
3) **Downside:** If you update the image with the same tag and it’s cached, it will not pull the new image.

## Never
1) The image is never pulled from the registry.
2) Kubernetes expects the image to already exist on the node.
3) **Use case:** When using preloaded images in air-gapped or offline environments.
4) **Downside:** If the image is missing locally, the Pod will fail.

## Default behaviour
* If image tag = latest → default policy is Always.
* For all other tags → default policy is IfNotPresent.

**imagepullPolicy.yaml**
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
    - name: nginx
      image: nginx:latest
      imagePullPolicy: Always
```
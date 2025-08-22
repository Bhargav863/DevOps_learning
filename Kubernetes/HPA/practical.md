**step1:** Create a deployment with resource requests and limits.
  ```
  kubectl apply -f configmap.yaml
  ```
  ```
  kubectl apply -f deployment.yaml
  ```
  Note: refer to k8-roboshop for deployment file, use the web for deployment.
**Step2:** Make sure service is created and attached to the deployment.
  ```
  kubectl appy -f service.yaml
  ```
**Step3:** Create a HPA
  ```
  kubectl apply -f hpa.yaml
  ```
With this setup, the HPA will automatically scale the number of nginx pods between 1 and 10 based on the CPU utilization, aiming to keep it around 50%.
**Step4:** Testing

Check the pod status before generating the load
```
kubectl top pods -n roboshop
```
Run this command to generate load:

```
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://web-service; done"
```
This command will continuously generate requests to the nginx-svc service, thereby increasing the CPU utilization of the nginx pods.

To observe the CPU utilization and the status of the HPA, use the following commands:

Check the CPU utilization of the pods:

```
kubectl top pods -n roboshop
```
Monitor the HPA status:
```
kubectl get hpa -w
```
These commands will help you monitor the CPU usage and see if the HPA adjusts the number of pods in response to the increased load.

By following these steps, you can validate the functionality of the HPA and ensure it dynamically scales your application based on CPU utilization.

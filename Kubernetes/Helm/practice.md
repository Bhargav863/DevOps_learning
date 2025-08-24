1) Install the helm
   ```
   curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
   chmod 700 get_helm.sh
   ./get_helm.sh
   ```
2) Create a chart.yaml. It is the metadata of your application. Refer to chart.yaml under Helm charts.
3) Create a template folder, this is where we keep your deployment manifest files. 
4) Create the deployment.yaml and service.yaml in the templates.
5) Install the chart
   ```
   helm install <name of the chart> <chart>
   ```
   ```
   helm install nginx .
   ```
6) **.** specifying the chart.yaml
7) Install means, it gone through the files inside the template and ran those. You can check by listing pods and svc
   ```
   kubectl get pods -n roboshop
   ```
8) This is not the actual advantage, actual advantage lies in values.yaml. Now parameterize the values.
9) Create a values.yaml file. And parametrize the values and define those in values.yaml.
10) Now upgrade the application by running below command
    ```
    helm upgrade nginx .
    ```
    you will see the revison 2, means it's updated. Earlier it was revision 1.
11) If you check the pods. You will see 3 pods.
    ```
    kubectl get pods -n roboshop
    ```
12) Something is wrong with the current release, how can you easily revert back the current version?
    1) Check the history
       ```
       helm history <chart_name>
       ```
    2) I want to rollback to the previous version of revison 1 or 2.
       ```
       helm rollback <chart_name> <revision>
       helm rollback nginx 2
       ```

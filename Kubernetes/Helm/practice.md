1) Install the helm
   ```
   curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
   chmod 700 get_helm.sh
   ./get_helm.sh
   ```
2) Create a chart.yaml. It is the metadata of your application. Refer to chart.yaml under Helm charts.
3) Create a template folder, this is where we keep your deployment manifest files. 
4) Create the deployment.yaml and service.yaml in the templates.
5) 
* Terraform .tfvars files are typically used to assign values to input variables specified in your terraform configuration.
* They allow you to separate configuration values from your code and make it easier to manage different configuration for different environments like prod,dev,staging to store some sensitive information without exposing it in your code.
* For example, we need 10 instances in dev and 10 instances in prod, here instances names be like
   1) for dev - mongodb-dev
   2) for prod - mongodb-prod
* variables.tf --> you can keep default values inside the variables.tf and it's not mandatory to keep default values, but you should declare variables.
* terraform.tfvars --> It is the default name for tfvars, It is used to override the default values mentioned inside the variables.tf. This will load automatically if you name it as terraform.tfvars.

How you typically use .tfvars for multi-environment?
1) Define your input variables in your terraform code(variables.tf).
2) Create a .tfvars file each env, each containing specific values for the input variables.
3) While running terraform command you can sepcify which .tfvars files to use with the help of -var-file option.
```
terraform apply -var-file=Dev/dev.tfvars
```

You need to use separate state file per environment, so you need to use separate backend for each env. To initialize the terraform run the below command.
```
terraform init --reconfigure --backend-config=dev/backend.tf
```
```
terraform apply -var-file=dev/dev.tfvars --auto-approve
```

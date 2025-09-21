How terraform is understanding about the changes to infrastrucutre?
* Declarative scripting that can create resources based on tf files.
* Terraform responsibility to create resources whatever you write in tf files.
* tf files = declaration of resources = ordering terraform to create resources.

How terraform know what resources it has created?
* Terraform state file helps to keep track of resources managed/created by terraform and their current state.
* This file often named with terraform.tfstate is a json file or HCL formatted file that contains the infrastructure current state such as resource attributes,dependencies and metadata.

**Advantages of Terraform statefile:**
* **Resource Tracking:** It ensures that terraform can accurately update or destroy resources when needed.
* **Concurrency control:** Terraform uses the statefile locking to prevent the multiple users or process from modifying the resources at the same time.
* **Plan Calculation:** Terraform uses the statefile to calculate and display the difference between current infrastructure and the desired infrastructure. This helps to preview the changes before you apply.

**Drawbacks to local statefile:**
**Usecase:** Sensitive information such as APIKeys or passwords, maybe stored in the statefile.
**Case1** : If you keep the statefile in your server, where your terraform project built. This will be a security risk because whomever have access to the terraform project will be able to acess the terraform state file.
**Case2** : If you store your terraform state file in github. This poses a security risk because repo often shared among different teams. If 2 devops engineers clones the terraform repo and run the terraform apply at the same time from their local then it will create duplicate resources.

**Overcoming drawbacks with remote Backend:**
* A remote backend stores the terraform statefile outside your local system and version control.
   1) Aws s3 bucket
   2) Terraform cloud
   3) Azure Blob storage
* If you use s3 as a remote backend, the statefile will get created in s3 bucket instead of local machine.

**Demo for remote Backend**
* Create a s3 bucket for remote backend.
* write your terraform code to create an EC2 instance.
* Add backend.tf for the remote backend.

**state locking with DynamoDB:**

* If multiple people trying to execute same terraform file simultaneously, there may be issue that duplicate of resources or error while creating resources or accidental changes to the resources.
* To overcome this problem, we can use state locking.
* When multiple people trying to execute the same terraform simultaneously, but only one person can be able to execute at a time because of state locking.
* DynamoDB table is used for state locking when a remote backend is configured.

Create a Dynamodb table by adding it to the above ec2 tf files. you can see only DynamoDB will be created that's because of the state file.

```
resource "aws_dynamodb_table" "terraform-lock" {
  name         = "terraform lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCK ID"
  attribute {
    name = "LOCK ID"
    type = "S"
  }
  tags = {
    Name = "terraform-lock"
    ENV  = "production"
  }
}
```
* Now run terraform plan and you will see like 1 resource to add as Ec2 is already there.
  ```
  Plan: 1 to add, 0 to change, 0 to destroy.
  ```
* Configure the dynamo_db table in the remote backend.
  ```
  dynamodb_table = "table-name"
  ```
* Reconfigure by running below command.
  ```
  terraform init -reconfigure
  ```
* Delete the EC2 instance by commenting DynamoDB table code and observer terraform acquiring state lock. 
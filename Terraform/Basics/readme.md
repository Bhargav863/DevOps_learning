Before start writing the terraform files we need to understand the providers.

**Providers:** <br />
  A provider in Terraform is a plugin that enables interaction with an API. This includes Cloud providers and Software-as-a-service providers. The providers are specified in the Terraform configuration code. They tell Terraform which services it needs to interact with.

**provider.tf**
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
```
* when you run the terraform it will first install the AWS provider and later it will create the resources.

**STEPS FOR PRACTICE**
1) Write a terraform file to create ec2 instance. Basic syntax is 
   ```
   resource "what-resource" "name-of-your-resource"{
    # configuration options
   }
   ```
2) Please refer to below config for ec2.
   ```
   resource "aws_instance" "my_ec2" {
    ami           = "ami-0360c520857e3138f"
    instance_type = "t2.micro"
    }
   ```
3) Here the values are hardcoded, i want to read the values using variables.

* Variables in terraform are placeholders for values that can be passed through parameters. Below is the syntax for the variable.
**variables.tf** <br />
  ```
  variable "variable_name"{
    type=string #this is the data type
    default="value for the variable
  }
  ```
4) Refer all the terraform file how variables are using. Below is the example for ec2.
   ```
   resource "aws_instance" "my_ec2" {
    ami             = var.ami
    instance_type   = var.instance_type
    subnet_id       = var.subnet_id
    security_groups = [aws_security_group.MY-SG.id]
    }
   ```
5) With this, my ec2-instance is creating without name. And also i want to organize the EC2 instances according to their environment and some other factors. For this purpose we can use tags.

    **tags:** <br />
    In Terraform, tags are just key-value pairs that you can attach to AWS resources (like EC2, S3, VPCs, etc.) to organize, identify, and manage them.

    **Cost tracking** – You can filter AWS billing reports by tags like Project, Environment, or Team.

    **Automation** – Many AWS services (like backup, monitoring, auto-scaling) can filter/select resources by tags.

6) Add tags to your ec2.tf file for better identification.
   ```
   tags = {
        Name      = "Terraform-ec2"
        ENV       = "dev"
        Terraform = "true" # specifying created by terraform code

    }
   ```
7) Instead of hardcoding values we can use maps in variables to define tags.
   ```
   variable "tags" {
    type = map(any)
    default = {
        Name      = "Terraform-ec2"
        ENV       = "dev"
        Terraform = "true" # specifying created by terraform code
    }
    }
    ```
8) With the above terraform code, i am able to create the EC2 instance. For login to that server i need to go to the aws console and take the public IP. Instead of that i want to print the public IP and private IP on the terminal as a output after my EC2 instance is created. For that we can use output.tf file to print the public once the ec2 is created.
 
    **outputs**
    * Outputs in Terraform are values that you export from your configuration after resources are created.
    * They’re super useful when you want to see important details (like instance IPs, bucket names, VPC IDs) after terraform apply.
    * They can also be used to pass values between modules.
9) create an output.tf file to print the public and private IP.
   ```
   output "public_ip" {
    value = aws_instance.my_ec2.public_ip
    }

   output "private_ip" {
    value = aws_instance.my_ec2.private_ip
    }
   ```






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



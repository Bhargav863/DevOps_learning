A terraform module is collection of standard terraform files in a dedicated directory. Terraform modules encapsulates the group of resources dedicated to one task, reducing the amount of code you have to develop for similar infrastructure.

**Terraform modules = reusable building blocks for infrastructure, just like functions in code.**

A typical module can look like
```
 modules/
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── vpc/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```
### What is the difference between resources and modules in terraform?
* A resource is the most basic building block in terraform. It directly represents an infrastructure object, like an AWS EC2 instance, an S3 bucket, or a VPC. Each resource block maps to one real-world infrastructure object.
* A module is the collection of resources that are used together to acheive a reusable use-cases.

There are two types of modules
1) **Root Module:** The main configuration where you call other modules.The folder where you run terraform init/plan/apply.
2) **Child Module:** A Module is located in it's own directory and defines resources for a specific task like creating an EC2 and VPC.

**Benefits of using modules:**

* **Code reusability:** Once you create a module you can use it anywhere without rewriting the code.
* **Versioning and Maintenance:** Modules can have their own versioning. When you update a module, you can increment it's version, and other projects which are using that module can choose when to adopt that newer version, helping to prevent unexpected changes in existing deployments.
* **Clean and oragnized code:** Instead of having a large main.tf file, you can break it down into smaller, more manageable pieces.
* **consistency:** Using the same modules ensures that resources are created in a consistent way, avoiding mistakes or redundancy.


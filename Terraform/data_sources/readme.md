In Terraform, a data source lets you fetch or reference existing information from outside of Terraform (like a cloud provider, external API, or files).

Unlike resources (which create or manage infrastructure), data sources are read-only.

They don’t create anything; they just query and return information that you can use in your configuration.

You use data sources when:

  * You want to reference existing infrastructure (like an existing VPC, AMI, or subnet).

  * You don’t want to hardcode values (like IDs, names, or IPs).

  * You need dynamic lookups (e.g., get the latest AMI instead of updating it manually).

datasource syntax:
------------------
```
data "type-of-data" "your-friendly-name" {

}
```
### How to refer?
```
data.<type-of-data>.<your-friendly-name>.argument
```
### Example
```
data.aws_ami.amazonlinux2.id
```

### Example 1:


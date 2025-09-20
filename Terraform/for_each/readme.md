### What is for_each?
for_each let's you create multiple resources based on a map or a set of strings.
Instead of duplicating blocks of code, you define a single resource and Terraform expands it.

count --> good for lists and indexed by numbers.
for_each --> good for maps and indexed by key.

list = [value1,value2]
map = { key = value }

Example: Create multiple EC2 instances with for each, I want t3.medium if the instance is DB or else t2.micro.

I have created a varible instances with type map. When you use for-each to iterate over a map, it will give us a seperate variable called each. 
In our scenario
each.key = "instance_name"
each.value = "instance_type"

Add route53 record as well
If it is a web instance give public IP otherwise give private IP.


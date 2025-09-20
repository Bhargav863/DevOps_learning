### What is Dynamic block
A dynamic block in Terraform is used when you want to generate nested blocks dynamically, based on a variable or a list/map.

Instead of repeating the same nested block multiple times, you can loop over a collection.

Example: A common use case for dynamic blocks is creating multiple security group rules. Instead of writing a separate ingress block for each rule, you can use a dynamic block to generate them from a variable.

Create a security group named roboshop, allow 3 ingress rules by opening ports for http,https,ssh.

```
 dynamic "ingress" {
    for_each = var.ingress # here you will get a variable named ingress to iterate over the list
    content {
      description = ingress.value["description"]
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
```
why ingress is the iterator here?

Actual dynamic block syntax
```
dynamic "label"{

}
```
In dynamic block, the block label itself becomes the implicit iterator.
Terraform automatically creates a temporary object named exactly as the block label for each iteration.

so here :
* for_each = var.ingress --> iterates over your list or map of ingress rules.
* ingress (the block label) → becomes the iterator object.
* ingress.value → is the current item in the iteration.

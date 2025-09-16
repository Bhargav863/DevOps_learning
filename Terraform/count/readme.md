I want to create multiple 3 Ec2 instances, instead of duplicating the code i can use count and count index.

**count:**
  * count is the meta argument in terraform which tell terraform how many resources to create dynamically.
**count-index:**
  * count.index is the 0-based number of the current resource in the loop.
  * Useful for:
     1) Creating unique names
     2) Assigning different values per resource


I have a situation that, if i am creating a server for mysql or Mongodb, i want the t3.medium as the instance type and for rest of the server i need to use t2.micro.
In this can, you can go terraform conditions. Below is the syntax
```
expression? "value"(this value will take if condition is true ): "value" (if condition is false this will be taken)
```

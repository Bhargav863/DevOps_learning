Locals are similar to the function scoped variables in any programming language.Local values assign names to expressions, letting you use the name multiple times within a module instead of repeating the expression.
You can define local values in any module. Local values can be any valid Terraform expression, and can reference variables, resource attributes, function outputs, or other local values to transform or combine data.

Local block allows assigning names to the expressions.
```
locals {
  <LOCAL_NAME> = <EXPRESSION>
  <OTHER_LOCAL_NAME> = <OTHER_EXPRESSION>
}
```
**USES:**
  * If a value/variable is used multiple times declare it in local and refer to the local.
  * you can create repetitive expression in local and refer it anywhere in the file.
  * you can combine variables with locals for best results.

**NOTE:** We should not over utilise locals, it should be used to avoid repeating the same values or expressions multiple times in a configuration.
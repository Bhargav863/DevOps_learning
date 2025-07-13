### variables
* Variables follows dry Princple
    DRY --> don't repeat yourself


* create a variable and assign value to it...

* wherever you are using instead of value, replace it with variable name..


## variable-name=value

1. declaring inside the script
2. how to execute a command inside shell script and take the output
3. you can always get the values of variables from command line

### 1-variables.sh
```
#!/bin/bash

echo "Hello Team, I am implementing varibales in this script"

var1=Bhargav
var2=sumati

echo "$var1: Hi $var2"
echo "$var2: Hi $var1, How are you"
echo "$var1: Hi I am doing good $var2, How are you?"
echo "$var2: I am good $var1, Thanks for asking"
```


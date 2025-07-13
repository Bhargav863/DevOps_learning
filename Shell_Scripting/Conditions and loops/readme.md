## Special parameters
* $0--> Name of the script
* $@--> All the arguments passed to the script.
* $#--> Total number of arguments passed to the script.
* $$--> Current process ID of the shell
* $?--> Exit status of the last ran command
## Defining an array inside the shell script
```
persons=("Bhargav" "ram" "Sumati" "Srinu" "Sunil")
```
* Inside array we will always refer values with index and the index starts from zero
* Let's look at an example to understand better.

**Special_params.sh**
```
#!/bin/bash

persons=("Bhargav" "Sumati" "Srinu" "Sunil")

echo "Number of persons are ${#persons[@]}"
echo "The first person is ${persons[0]}"
echo "All persons are ${persons[@]}"

-------------------------------------------------------------------------------
echo "$(date)"
# when you are running system commands with echo, you need to use (). For variable it's not needed.
echo "The exit code of last commad is : $?"

lsl-read
echo "The exit code of last commad is : $?"

echo "The process ID of current shell is $$"

```

#!/bin/bash

persons=("Bhargav" "Sumati" "Srinu" "Sunil")

echo "Number of persons are ${persons[$#]}"
echo "The first person is ${persons[$0]}"
echo "All persons are ${persons[$@]}"

-------------------------------------------------------------------------------
echo "$(date)"
# when you are running system commands with echo, you need to use (). For variable it's not needed.
echo "The exit code of last commad is : $?"

lsl-read
echo "The exit code of last commad is : $?"

echo "The process ID of current shell is $$"

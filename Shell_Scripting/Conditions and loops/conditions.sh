#!/bin/bash

#Check if the number is greater than 10 or not.

Number=$1

if [ $Number -gt 10 ]; then
    echo "$Number is greater than 10"
elif [ $Number -eq 10 ]; then
    echo "$Number is equal to 10"
else
    echo "$Number is less than 10"
fi

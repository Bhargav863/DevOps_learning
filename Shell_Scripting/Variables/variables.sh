#!/bin/bash
GREEN='\e[32m'
yellow='\e[43m'
NC='\e[0m' # No colour

echo "Hello Team, I am implementing varibales in this script"

var1=Bhargav
var2=sumati

echo -e "$GREEN $var1: Hi $var2 $NC"
echo -e "$yellow $var2: Hi $var1, How are you $NC"
echo -e "$GREEN $var1: I am doing good $var2, How are you? $NC"
echo -e "$yellow $var2: I am good $var1, Thanks for asking $NC"

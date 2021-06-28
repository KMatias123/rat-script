#!/bin/bash

# Dependencies: netcat

if [[ $1 == "" ]]; then
    echo "Please provide input for the port."
    exit
fi

nc -lp $1

echo ""

if [[ $? != 0 ]]; then
    echo "Then netcat prcess failed to execute correctly, this may mean that you don't have netcat installed. (the \"nc\" command)"
else
    echo "Thank you for using my script :D"
fi
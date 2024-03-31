#!/bin/bash

# knock.sh <ip> <port1> <port2> <port3>
HOST=$1
shift
for PORT in "$@"
do
        sudo nmap -Pn -max-retries 0 -p $PORT $HOST
done
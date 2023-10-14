#!/bin/bash
ping -c 1 -W 1 $1
if [ $? -gt 0 ]
then
    echo "Error in pinging $1"
    exit 1
else
    echo "Connection OK"
    exit 0
fi

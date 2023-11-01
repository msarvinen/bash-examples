#!/bin/bash
ping -c 1 -W 1 $1
if [ $? -gt 0 ]
then
    # do your stuff here in case of error
    echo "Error in pinging $1"
    exit 1
else
    # do your stuff here in case of connection
    echo "Connection OK"
    exit 0
fi

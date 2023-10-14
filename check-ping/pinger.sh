#!/bin/bash
ping -c 1 -W 1 8.8.8.8
if [ $? -gt 0 ]
then
    echo "Error in pinging 8.8.8.8"
    exit 1
else
    echo "Connection OK"
    exit 0
fi

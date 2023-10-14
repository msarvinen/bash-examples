#!/bin/bash
./$1
rc=$?
if [ $rc -eq 0 ]
then
    echo "error code 0"
    exit 0
elif [ $rc -eq 1 ]
then
    echo "error code 1"
    exit 1
elif [ $rc -eq 2 ]
then
    echo "error code 2"
    exit 2
else
    echo "error code -gt 2"
    exit 3
fi

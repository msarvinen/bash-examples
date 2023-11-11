#!/bin/bash

# make a directory for logs
mkdir update

# get list of hosts
input=`cat rhosts`
echo $input
for line in $input
do
  host=`echo $line | cut -d "," -f 1`
  folder=`echo $line | cut -d "," -f 2`
  echo "working with host $host and folder $folder"
  ./update.sh $host $folder
done

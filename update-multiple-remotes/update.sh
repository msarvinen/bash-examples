#!/bin/bash
NOW=$(date +"%Y%m%d_%H%M%S")
host=$1
folder=$2

# Write logs per host to ./update -folder so you can later check what has been done
echo 010101010101010101010101010101010101 >> update/$host-updates.txt
echo $host - $NOW >> update/$host-updates.txt
echo 101010101010101010101010101010101010 >> update/$host-updates.txt
echo  >> update/$host-updates.txt

##### UPDATE 1 ##########
echo  UPDATE 1 >> update/$host-updates.txt
# copy some script in to the remote host, print into stdout + file
echo rsync -avh --progress loop.py $host:$folder | tee -a update/$host-updates.txt
rsync -avh --progress loop.py $host:$folder | tee -a update/$host-updates.txt
# Start copied program at remote host
echo ssh -n -f $host "sh -c 'nohup python3 loop.py 10 > /dev/null 2>&1 &'" | tee -a update/$host-updates.txt
ssh -n -f $host "sh -c 'nohup python3 loop.py 10 > /dev/null 2>&1 &'" 
################################

echo  >> update/$host-updates.txt

##### UPDATE 2 ##########
echo  UPDATE 2 >> update/$host-updates.txt
# Do something else at remote host
echo ssh -n -f $host "sh -c 'chmod +700 loop.py > /dev/null 2>&1 &'" | tee -a update/$host-updates.txt
ssh -n -f $host "sh -c 'chmod +700 loop.py > /dev/null 2>&1 &'" 
################################

echo  >> update/$host-updates.txt

#!/bin/bash
user=$1
host=$2
command=$3
cat passwd.txt | ssh $user@$host cat \| sudo --prompt="" -S -- $command

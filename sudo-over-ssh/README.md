## This is to run sudo command automatically at far-end.
## This means that password is not prompted at any phase.
## Ssh connection is expected to be authenticated based on public key.

## Copy SSH public key into far-end (to disable pwd prompt for ssh) 
## This needs to be performed only once

# In case you dont have ssh keys, you have to run this first:
ssh-keygen

# copy you ssh public key into far-end
ssh-copy-id <user>@<farend-ip>

# now you should be able to login via ssh to far-end without password

## For the script it self, far-end sudoer password is expected to be saved passwd.txt -file
## just the password, no carriage return <CR> nor line feed <LF>

## SCRIPT IT SELF
## USAGE
./dosu.sh <user> <URL/IP> <command-without-sudo>

## EXAMPLE
./dosu.sh pi 192.168.88.175 "docker ps"




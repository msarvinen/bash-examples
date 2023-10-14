### This is to run sudo command automatically at far-end.
 This means that password is not prompted at any phase.
 Ssh connection is expected to be authenticated based on public key.

### Copy SSH public key into far-end (to disable pwd prompt for ssh) 
 This needs to be performed only once

### In case you dont have ssh keys, you have to run this first:
_ssh-keygen_

### copy you ssh public key into far-end
_ssh-copy-id user@farend-ip_

now you should be able to login via ssh to far-end without password

### Add sudoer password into passwd.txt -file
 This is required for the executed command
 Just the password, no carriage return <CR> nor line feed <LF>
 
### USAGE
_./dosu.sh <user> <URL/IP> <command-without-sudo>_

### EXAMPLE
_./dosu.sh pi 192.168.88.175 "docker ps"_




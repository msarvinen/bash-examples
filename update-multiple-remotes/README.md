### These scripts are used to do wanted updates on selected remote hosts
 ssh connection is expected to be authenticated based on public key

### Copy SSH public key into far-end (to disable pwd prompt for ssh) 
 This needs to be performed only once

### In case you dont have ssh keys, you have to run this first:
_ssh-keygen_

### copy you ssh public key into remote hosts
_ssh-copy-id user@farend-ip_

now you should be able to login via ssh to far-end without password

### List host IPs and folder for host operations you need to run remote ops
 These are listed in the rhosts file separated with comma:
 _user@host,/home/user_
 
### USAGE
_./runthis.sh_



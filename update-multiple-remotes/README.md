### These scripts are used to do specified updates on selected remote hosts
 ssh connection is expected to be authenticated based on public key.
 So copy SSH public key into hosts to avoid pwd prompts. 
 This needs to be performed only once per host.
 
 In case you dont have ssh keys generated at your local machine, you have to make them:
 
 _ssh-keygen_

 Then copy you ssh public key into remote hosts:
 
 _ssh-copy-id user@farend-ip_

 Now you should be able to login far-end with ssh without password.

 Now you need to list hosts & folder for remote operations into "rhosts" file:
 
 _user@host,/home/user_

 Now you are ready to do perform remote operations specified in the "update.sh":
 
### USAGE
 _./runthis.sh_



### This script compares local folder files to remote folder files.
### Found files with same name are compared to localfiles based on sha256sum.

As remote connection is utilizing ssh, password is propted while connecting
to remote host in case public key based authentication is not enabled and keys copid to remote host. 

### USAGE
./compare.sh <LOCAL-FOLDER> <REMOTE-USER>@<REMOTE-HOST> <REMOTE-FOLDER>

### EXAMPLE
./compare.sh ~/temp/filet ms@192.168.88.175 /home/ms/scripts/filet
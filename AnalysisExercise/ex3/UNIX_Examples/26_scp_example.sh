#!/bin/bash

# You can use the scp command to copy files from one UNIX machine to another.
# It works similarly to cp except that you need to prefix the remote location
#   with a user name and server. It will ask for your password when you 
#   execute the command.

echo "Copy file to remote server:"
scp mail-list.txt userName@scp.fsl.byu.edu:/tmp/

# This will use a similar syntax to show the file on the remote server
echo "Contents on remote server:"
ssh userName@scp.fsl.byu.edu "ls -al /tmp/mail-list.txt"

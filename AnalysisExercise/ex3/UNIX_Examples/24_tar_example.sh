#!/bin/bash

# Delete temp file in case it already exists
rm -f /tmp/mail-list*

# Copy files to temp directory
cp mail-list* /tmp/

# Create a tar file
tar -cvf /tmp/mail-list.tar mail-list*

# Create a tar.gz file
tar -zcvf /tmp/mail-list.tar.gz mail-list*

# Show info about files that were created
ls -al /tmp/mail-list*

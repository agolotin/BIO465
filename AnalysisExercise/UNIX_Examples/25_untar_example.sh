#!/bin/bash

# Remove files if they already exist
rm -f /tmp/mail-list*txt

# Unpack tar file
cd /tmp/
tar -xvf /tmp/mail-list.tar.gz

# Show info about files that were unpacked
ls -al mail-list*

# Remove files
rm -f /tmp/mail-list*txt

# Unpack and decompress tar.gz file
cd /tmp/
tar -zxvf /tmp/mail-list.tar.gz

# Show info about files that were unpacked
ls -al mail-list*

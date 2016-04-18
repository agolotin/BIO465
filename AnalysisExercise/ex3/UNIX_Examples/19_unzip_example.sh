#!/bin/bash

# Delete existing filees if necessary
rm -f /tmp/mail-list*.txt

# Unpack the zip file we just created to the temp directory
cd /tmp
unzip mail-list.zip
rm mail-list.zip

# Show info about files that were unzipped
ls -al /tmp/mail-list*

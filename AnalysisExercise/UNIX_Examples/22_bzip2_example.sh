#!/bin/bash

# Delete temp file in case it already exists
rm -f /tmp/mail-list.txt.bz2

# Create a bzip2 file
cp mail-list.txt /tmp/
bzip2 /tmp/mail-list.txt

# Show info about file that was zipped
ls -al /tmp/mail-list.txt.bz2

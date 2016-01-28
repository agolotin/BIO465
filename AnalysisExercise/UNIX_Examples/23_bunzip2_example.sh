#!/bin/bash

# Delete temp file in case it already exists
rm -f /tmp/mail-list.txt

# Extract contents from bzip2 file
bunzip2 /tmp/mail-list.txt.bz2

# Show info about file that was unzipped
ls -al /tmp/mail-list.txt

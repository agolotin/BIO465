#!/bin/bash

# Delete temp file in case it already exists
rm -f /tmp/mail-list.txt.gz

# Create a gzip file
cp mail-list.txt /tmp/
gzip /tmp/mail-list.txt

# Show info about gzipped file
ls -al /tmp/mail-list.txt.gz

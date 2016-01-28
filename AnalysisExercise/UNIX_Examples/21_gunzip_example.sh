#!/bin/bash

# Extract contents from gzip file
gunzip /tmp/mail-list.txt.gz

# Show info about file that was unzipped
ls -al /tmp/mail-list.txt

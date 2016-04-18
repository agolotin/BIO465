#!/bin/bash

# First, delete temp file in case it already exists
rm -f /tmp/mail-list.zip

# Create a zip file
zip /tmp/mail-list.zip mail-list*

# Show info about zipped file
ls -al /tmp/mail-list.zip

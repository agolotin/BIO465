#!/bin/bash

# Print every line that is longer than 50 characters
awk 'length($0) > 50' mail-list.txt

#!/bin/bash

# Redirect standard output to nowhere
# /dev/null is a placeholder on UNIX systems, such anything that
#   is saved to it will not actually be saved anywhere.
# You can use this in situations where you don't want to see the
#   standard output.
echo "This might seem pointless. When would you use this?" > /dev/null

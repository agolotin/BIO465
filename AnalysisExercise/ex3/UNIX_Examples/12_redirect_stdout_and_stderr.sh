#!/bin/bash

# Redirect standard output and standard error to a temp file
echo "Something good and bad happened. Life must be normal!!!" > /tmp/hello3 2>&1

# Display contents of temp file
cat /tmp/hello3

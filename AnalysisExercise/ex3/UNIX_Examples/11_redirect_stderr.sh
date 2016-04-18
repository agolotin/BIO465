#!/bin/bash

# Redirect standard error to a temp file
echo "Something bad happened. Run for the hills!!!" 2> /tmp/hello2

# Display contents of temp file
cat /tmp/hello2

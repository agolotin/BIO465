#!/bin/bash

# Redirect standard output to a temp file
echo "Hello, world" > /tmp/hello4

# Now append additional lines to the temp file
echo "Hello again" >> /tmp/hello4
echo "Did I say hello?" >> /tmp/hello4

# Display contents of temp file
cat /tmp/hello4

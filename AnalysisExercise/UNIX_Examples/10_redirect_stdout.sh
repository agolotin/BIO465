#!/bin/bash

# If needed, you can read more about standard streams here: https://en.wikipedia.org/wiki/Standard_streams

# Redirect standard output to a temp file
echo "Hello, world" > /tmp/hello1

# Now display contents of the file that was created
cat /tmp/hello1

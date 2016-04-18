#!/bin/bash

# If needed, you can learn more about pipes here: https://en.wikipedia.org/wiki/Pipeline_(Unix)

# The following commands list files in the current directory and use sed to replace a, e, i, or o with u
ls -l | sed -e "s/[aeio]/u/g"

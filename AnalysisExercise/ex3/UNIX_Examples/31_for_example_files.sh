#!/bin/bash

# In bash, you can also use "for" loops. The following loop lists
#   all the files that match a wildcard pattern.

for f in mail-list*
do
  echo "Here is a file:"
  echo $f
done

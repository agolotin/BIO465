#!/bin/bash

# It is possible to write "if" statements in bash scripts.
#   Below is an example that checks the value stored in a
#   variable called "x."

x="hello"

if [ "$x" == "hello" ]
then
  echo "$x"
  echo "goodbye"
fi

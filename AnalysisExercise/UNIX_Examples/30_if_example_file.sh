#!/bin/bash

# We can also use "if" statements to check with a file exists.

if [ -f mail-list.txt ]
then
  echo "A file called mail-list.txt exists!"
fi

if [ ! -f some_random_file ]
then
  echo "A file called some_random_file does not exist."
fi

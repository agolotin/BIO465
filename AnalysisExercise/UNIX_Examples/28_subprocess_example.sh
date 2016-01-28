#!/bin/bash

# In this example, you will see two ways of identifying the number
#   of lines in a file. In the first example, we will use the wc
#   command as in the previous example. However, we will also pipe
#   the output to the awk command, which will extract the number
#   from the output (and exclude the file name from the output).

echo "Method 1:"
wc -l mail-list.txt | awk '{ print $1 }'

# But let's say we wanted to store the number of lines in a variable.
#   We could do that with a subprocess command, as shown below.
#   We define a variable name and set the value equal to the result of
#   of the command that parses the number of lines in the file.
#   We surround the subprocess command in $().

echo "Method 2:"
numLinesInFile=$(wc -l mail-list.txt | awk '{ print $1 }')
echo $numLinesInFile

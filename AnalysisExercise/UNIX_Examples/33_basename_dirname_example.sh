#!/bin/bash

# This command creates a variable that contains an absolute path to mail-list.txt
f=$(pwd)/mail-list.txt

# This command prints the absolute path
echo "Full file path:"
echo $f

# This command uses the basename command to print just the file name
echo "File name:"
basename $f

# This command uses the dirname command to print just the directory name
echo "Directory name:"
dirname $f

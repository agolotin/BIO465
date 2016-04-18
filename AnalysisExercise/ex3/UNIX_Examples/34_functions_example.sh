#!/bin/bash

# It is possible to create functions in bash scripts.

# Define a simple function that echoes the parameter values
function sayHello {
  parameter1=$1
  parameter2=$2

  echo "${parameter1}, ${parameter2} (from a function)!!"
}

# Invoke the function and pass parameters to it
sayHello "Hello" "world"

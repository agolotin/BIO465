#! /bin/bash

set -o errexit

grep "stop_gained" Annotated_Variants.vcf | awk -F'\t' '{print $2}' | wc -l | sed 's/ //g' > output.txt # My output before the sed command just contained white space and the number

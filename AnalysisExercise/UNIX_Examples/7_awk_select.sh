#!/bin/bash

# Print the third column (tab-separated)
awk -F'\t' '{ print $3 }' mail-list-tab.txt

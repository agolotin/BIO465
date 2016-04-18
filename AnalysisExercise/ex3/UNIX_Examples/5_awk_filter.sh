#!/bin/bash

echo Print lines that contain "li"
awk '/li/ { print $0 }' mail-list.txt

echo Print lines that do not contain "li"
awk '!/li/ { print $0 }' mail-list.txt

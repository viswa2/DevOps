#!/bin/bash

#####################################################
# Author: viswanath
# date: 25/06/2023
# outputs the node health
#####################################################

set -x # debug mode
set -e # exit the script when there is an error
set -o pipefail

# Disk size details size, used, available etc. 
df -h

# Running the process in the system
ps -ef | grep LENOVO | awk -F" " '{print $2}'

# CPU cores
nproc


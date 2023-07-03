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
# Retrieve process IDs for specific processes
echo "Running ps command"
ps -ef | grep -w '[L]ENOVO' | awk -F" " '{print $2}'
# Extract CPU MHz and cores information
echo "CPU information"
cat /proc/cpuinfo | awk '/MHz|cores/ && !seen[$0]++ {print $4}'


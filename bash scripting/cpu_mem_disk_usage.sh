#!/bin/bash

#######################################################################################
# This script is to monitor CPU, Memory, and Disk usage and send the output to a file 
# in table format and send an alert if either of them exceeds a certain threshold.
########################################################################################
set -x # Debug mode

# Thresholds for CPU, memory, and disk usage
cpu_threshold=90  # 90% CPU usage threshold
memory_threshold=80  # 80% memory usage threshold
disk_threshold=80  # 80% disk usage threshold

# Output file to store the monitoring results
output_file="monitoring_results.txt"

# Get the current timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

# Get memory usage percentage
memory_usage=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')

# Get disk usage percentage
disk_usage=$(df -h --output=pcent / | awk 'NR==2 {print $1}' | tr -d '%')

# Create the table format and append it to the output file
printf "| %-19s | %-12s | %-12s | %-12s |\n" "$timestamp" "$cpu_usage%" "$memory_usage%" "$disk_usage%" >> "$output_file"

# Check if any usage exceeds the thresholds and send an alert
if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
    echo "CPU usage exceeds threshold! Current usage: $cpu_usage%"
fi

if (( $(echo "$memory_usage > $memory_threshold" | bc -l) )); then
    echo "Memory usage exceeds threshold! Current usage: $memory_usage%"
fi

if (( $(echo "$disk_usage > $disk_threshold" | bc -l) )); then
    echo "Disk usage exceeds threshold! Current usage: $disk_usage%"
fi


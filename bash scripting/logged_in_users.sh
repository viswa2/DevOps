#!/bin/bash

#################################################################################################
# This script is executing to the list of users logged in by date and write it to an output file.
#################################################################################################

# Output file to store the list of users
output_file="logged_in_users.txt"

# Get the current date
current_date=$(date "+%Y-%m-%d")

# Get the list of users logged in on the current date
logged_in_users=$(who | awk '{print $1}')

# Create the output header
echo "List of Users Logged in on $current_date:" > "$output_file"
echo "-----------------------------------------" >> "$output_file"

# Write the list of logged in users to the output file
echo "$logged_in_users" >> "$output_file"

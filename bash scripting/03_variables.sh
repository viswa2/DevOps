#!/bin/bash

#script to show how to use variables

a=10
name=Viswa
age=30

echo "my $name and age is $age"

name=Paul
echo "my name is $name"

# var to store the output

HOSTNAME=$(hostname)

echo "Name of this machine is $HOSTNAME"

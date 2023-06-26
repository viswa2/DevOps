#!/bin/bash
age=30

if [ "$age" -lt 18 ] || [ "$age" -gt 40 ]
then 
	echo "age is correct"
else
	echo "age is not correct"
fi

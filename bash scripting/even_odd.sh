#!/bin/bash
number=1222

if [ $((number %2)) -eq 0 ]
then
    echo "$number is even number"
else
    echo "$number is odd number"
fi
#!/bin/bash
for i in {1..200}; do

if [[ $i == '200' ]]
then
    echo "Number $i"
    continue
fi
echo $i
done

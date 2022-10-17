#!/bin/bash

######################
#
# Description
#
# This script generates 10 unique numbers in range from 1 to 10 in random order.
# No input is required for script. Simply execute it.
#
######################

count=1
maxcount=10 # Qty of numbers to generate

while [ "$count" -le $maxcount ]      # Generating numbers
do
  number=$(($RANDOM % 10 + 1))

  while [[ " ${array[*]} " =~ " ${number} " ]] # Cheking if number already exist in array
  # until [[ ! " ${array[*]} " =~ " ${number} " ]] - another way
  do
  	number=$(($RANDOM % 10 + 1)) # Re-generating number
  done

  array=( "${array[@]}" "$number" )
  let "count += 1"  # Increasing counter
done

# Printing array's values
for value in "${array[@]}"
do 
	echo $value
done

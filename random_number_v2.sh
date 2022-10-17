#!/bin/bash

echo "This script generates unique random numbers in given range."
echo "Please enter range of numbers."
read -p "Range start: " min
read -p "Range end: " max

range=`expr $max - $min 2>/dev/null` # Checking if input is a number

while [[ ! $range -gt 0 ]] # Checking if input is a number
do
  echo "Wrong input. Please try again:"
  read -p "Range start: " min
  read -p "Range end: " max
  range=`expr $max - $min 2>/dev/null`
done

let "range += 1" # Including all numbers into range

read -p "Enter number's count: " maxcount

while [[ ! $maxcount -gt 0 ]] || [[ $maxcount -gt $range ]] # Checking if input is a number and qreater than range
do
  read -p "Wrong number's count. Please try again: " maxcount
done

count=1

while [ "$count" -le $maxcount ]      # Generating numbers
do
  number=$(($RANDOM % ($max - $min + 1) + $min))

  while [[ " ${array[*]} " =~ " ${number} " ]] # Cheking if number already exist in array
  # until [[ ! " ${array[*]} " =~ " ${number} " ]] - another way
  do
  	number=$(($RANDOM % ($max - $min + 1) + $min)) # Re-generating number
  done

  array=( "${array[@]}" "$number" )
  let "count += 1"  # Increasing counter
done

# Printing array's values
for value in "${array[@]}"
do 
	echo $value
done

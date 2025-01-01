#!/bin/bash

# Simple Interest Calculator
# Usage: ./simple-interest.sh <principal> <rate> <time>
# Example: ./simple-interest.sh 1000 5 2

# Check if correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Error: Please provide three arguments"
    echo "Usage: ./simple-interest.sh <principal> <rate> <time>"
    echo "Example: ./simple-interest.sh 1000 5 2"
    exit 1
fi

# Assign command line arguments to variables
principal=$1
rate=$2
time=$3

# Validate input: check if all arguments are numbers
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: All arguments must be numbers"
    exit 1
fi

# Calculate simple interest
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Calculate total amount
total=$(echo "scale=2; $principal + $interest" | bc)

# Print results
echo "Simple Interest Calculation Results:"
echo "--------------------------------"
echo "Principal Amount: \$$principal"
echo "Interest Rate: $rate%"
echo "Time Period: $time years"
echo "--------------------------------"
echo "Interest Amount: \$$interest"
echo "Total Amount: \$$total"
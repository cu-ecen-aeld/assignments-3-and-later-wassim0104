#!/bin/bash

# Check if required arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required - writefile and writestr"
    exit 1
fi

writefile=$1
writestr=$2

# Check if writefile is specified
if [ -z "$writefile" ]; then
    echo "Error: writefile argument is not specified"
    exit 1
fi

# Check if writestr is specified
if [ -z "$writestr" ]; then
    echo "Error: writestr argument is not specified"
    exit 1
fi

# Create the directory if it doesn't exist
dir=$(dirname "$writefile")
if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
fi

# Write content to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Unable to create the file $writefile"
    exit 1
fi

echo "File $writefile created successfully with the content:"
echo "$writestr"

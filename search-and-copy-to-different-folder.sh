#!/bin/bash

# Define source directory and destination directory
source_dir="/root/"
destination_dir="/root/"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' does not exist."
    exit 1
fi

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Iterate through each file name in the list file
while IFS= read -r filename; do
    # Search for the file in the source directory
    found_file=$(find "$source_dir" -type f -name "$filename")

    # If the file is found, copy it to the destination directory
    if [ -n "$found_file" ]; then
        cp -v "$found_file" "$destination_dir/"
    else
        echo "File '$filename' not found."
    fi
done < "new-added"

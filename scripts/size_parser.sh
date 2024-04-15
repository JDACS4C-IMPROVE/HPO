#!/bin/bash

# A script to find the best individual for each size of each dataset of each model. By using this to parse,
# then plotting the results, users can gain an understanding of the level of efficacy of differently sized runs

# The starting directory for the search
SEARCH_DIR="$1"
# Output file path
OUTPUT_FILE="$2"

# Check if the necessary arguments were provided
if [ -z "$SEARCH_DIR" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Usage: $0 <directory> <output_file.csv>"
    exit 1
fi

# Add a header to the CSV file
echo "Feature 1,Feature 2,Feature 3,Value" > "$OUTPUT_FILE"

# Find all instances of files starting with fitness- and ending with .txt and process them
find "$SEARCH_DIR" -type f -name "fitness-*.txt" | while read -r file; do
    # Extract the directory path and split into an array
    filepath=$(dirname "$file")
    IFS='/' read -r -a dir_array <<< "$filepath"
    # Get the length of the directory array
    len=${#dir_array[@]}
    # Extract the last three directories
    feature1="${dir_array[$len-3]}"
    feature2="${dir_array[$len-2]}"
    feature3="${dir_array[$len-1]}"
    # Get the value inside the file (assuming it's a single value for simplicity)
    value=$(cat "$file")
    # Write the directory names as features and the value to the CSV file
    echo "$feature1,$feature2,$feature3,$value" >> "$OUTPUT_FILE"
done

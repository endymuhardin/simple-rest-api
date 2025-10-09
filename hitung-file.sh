#!/bin/bash

jumlah=0
echo "Jumlah file : $jumlah"

hasil_ls=$(ls -l)
echo "$hasil_ls"

lines=()
while IFS= read -r line; do
    lines+=("$line")
done <<< "$hasil_ls"

# Access the array elements
echo "The first element is: ${lines[0]}"
echo "The second element is: ${lines[1]}"
echo "The third element is: ${lines[2]}"

# Get the total number of elements
echo "The array has ${#lines[@]} elements."

echo "=============="
# Loop through and count number of files and folders
folder_count=0
file_count=0
for i in "${lines[@]}"; do
    echo "$i"
    if [[ "$i" =~ ^d ]]; then
        echo "Baris ini adalah folder/directory"
        ((folder_count++))
    elif [[ "$i" =~ ^- ]]; then
        echo "Baris ini adalah file"
        ((file_count++))
    else
        echo "Baris ini bukan folder ataupun file"
        
    fi
done

echo "Jumlah folder : $folder_count"
echo "Jumlah file : $file_count"
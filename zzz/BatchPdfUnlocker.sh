#!/bin/env bash

# This script decrypts all the PDFs in the current folder and saves them in the output directory

output="$(pwd)"
files="$(find . -maxdepth 1 -name "*.pdf")"

echo -n "Enter password: "
read PASS

# Create the output directory if it doesn't exist
mkdir -p "$output"

for file in $files; do
    # Extract filename
    filename=$(basename "$file")

    echo "Decrypting $filename..."

    # Perform the decryption with qpdf
    qpdf --password="$PASS" --decrypt "$file" "$output/$filename"
done

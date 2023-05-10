#!/bin/bash

file="exports/braille.txt"

if [ -f "$file" ]; then
    line_number=1
    while IFS= read -r line; do
        final_line="    $line_number| ${line%%|*}"
        echo "$final_line"
        ((line_number++))
    done < "$file"
else
    error="File not found"
    echo -e "    -> Error: \e[1m\e[31m$error\e[0m"
fi
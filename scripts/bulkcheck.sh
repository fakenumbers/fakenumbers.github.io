#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -lt 1 ]; then
    echo "Usage: bulkcheck.sh <category> [<list.file>]";
    echo "Checks a newline-separated list of numbers against all numbers in <category>."
    echo "Prints \"Found <number>\" on match in CLI mode, or just the list of matched numbers, \
if you provide a <list.file> containing all numbers.";
    exit;
fi

if [ ! -d "$dir/../$1" ]; then
    echo "Error: category not found \"$1\""
    exit 100
fi

if [ $# -lt 2 ]; then
    echo "Enter numbers line by line or paste a list, press ENTER if you are done";
    file=-
else
    file=$2
fi

while IFS= read -r number; do
    if [ $# -lt 2 ]; then
        if [ "$number" == "" ]; then
            break;
        fi
        if ls "$dir/../$1/$number" >/dev/null 2>&1; then
            echo "Found $number"
        fi
    else
        if ls "$dir/../$1/$number" >/dev/null 2>&1; then
            echo "$number"
        fi
    fi
done < <(cat -- "$file" 2>/dev/null)

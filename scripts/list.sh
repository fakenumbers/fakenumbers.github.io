#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -lt 1 ]; then
    echo "Usage: list.sh <category> [\"<splitstring>\"]";
    echo "Get a list of all numbers in <category> split by <splitstring>. The list can be used for DB lookups, etc.";
    echo "<splitstring> is newline by default";
    exit;
fi

if [ ! -d "$dir/../$1" ]; then
    echo "Error: category not found \"$1\""
    exit 100
fi

first_line=1

while IFS= read -r number; do
    if [ $# -lt 2 ]; then
        echo "$number"
    else
        if [ $first_line -eq 1 ]; then
            printf "$number"
            first_line=0
        else
            printf "$2$number"
        fi
    fi
done < <(ls "$dir/../$1" 2>/dev/null)

if [ $# -eq 2 ]; then
    echo ""
fi

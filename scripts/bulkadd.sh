#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -lt 2 ]; then
    echo "Usage: bulkadd.sh <category> \"<commit message>\" [<list.file>]";
    exit;
fi

if [ ! -d "$dir/../$1" ]; then
    echo "Creating directory for category \"$1\""
    mkdir "$dir/../$1"
fi

if [ $# -lt 3 ]; then
    echo "Enter numbers line by line, press ENTER if you are done";
    file=-
else
    file=$3
fi

while IFS= read -r number; do
    if [ $# -lt 3 -a "$number" == "" ]; then
        break;
    fi
    touch "$dir/../$1/$number"
    git add "$dir/../$1/$number"
done < <(cat -- "$file" 2>/dev/null)

echo "Commit as \"$2\""
git commit -m "$2"
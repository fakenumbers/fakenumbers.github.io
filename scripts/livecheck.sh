#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -lt 2 ]; then
    echo "Usage: livecheck.sh <category> <number>";
    echo "Does a live check using curl and \
prints \"found <number>\" and exits with error 0 on match, otherwise error 1";
    echo "Attention: Do not use for bulk checks, download latest repository from \
https://github.com/fakenumbers/fakenumbers.github.io instead and run bulkcheck.sh locally" 
    exit;
fi

if curl --head --fail "https://fakenumbercheck.tk/$1/$2" >/dev/null 2>&1; then
    # match
    echo "found $2"
    exit 0;
else
    # not blacklisted
    exit 1;
fi
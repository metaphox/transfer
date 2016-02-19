#!/bin/bash

NEWFILES=()
while IFS= read -r line; do
    NEWFILES+=( "$line" )
done < <( git status --porcelain )

if [[ "${#NEWFILES[@]}" -le 0 ]]; then
    exit
fi

for f in "${NEWFILES[@]}"
do
    ff=$(echo $f | cut -d' ' -f2)
    # ignore hidden files
    if [[ $ff != .* ]]; then
        fsize=$(du -k "$ff" | cut -f1)
        # if file is too large, split it
        echo $fsize
    fi
done

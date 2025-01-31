#!/bin/env bash

# This script adds selected text to clipmark

clipmark="$HOME/clipmark.txt"
text="$(xclip -out -selection primary)"

if [[ ! -f "$clipmark" ]]; then
    dunstify "$clipmark does not exist. Creating it..."
    
    if ! touch "$clipmark"; then
        dunstify "Failed to create $clipmark"
        exit 1
    fi
fi

if [[ -z "$text" ]]; then
    dunstify "Nothing is selected"
    exit 1
fi

if grep -Fq "$text" "$clipmark"; then
    dunstify "'$text' is already in clipmark"
else
    echo "$text" >> "$clipmark"
    dunstify "'$text' added to clipmark"
fi

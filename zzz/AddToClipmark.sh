#!/bin/bash

# This script added selected text to clipmark

clipmark="$HOME/clipmark.txt"
text=$(xclip -out -selection primary)

if ! [ -f $clipmark ]; then
    dunstify "$clipmark does not exist. Creating it..."
    touch $clipmark

    if [ ! $? ]; then
        dunstify "failed to create $clipmark"
        exit 1
    fi
fi

if [ "$text" = "" ]; then
    dunstify "Nothing is selected"
    exit 1
fi


if grep $text $clipmark; then
    dunstify "$text is already  in clipmark"
else
    echo "$text" >> $clipmark
    dunstify "$text added to clipmark"
fi

exit 0

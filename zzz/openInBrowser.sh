#!/bin/bash

filepath="$1"

htmlpath="$filepath.html"

if $(cp "$filepath" "$htmlpath"); then
    dunstify "Opening mail in xlinks..."
    xlinks -g "$htmlpath" &

    sleep 2 && rm "$htmlpath"
    dunstify "Removed HTML file."
else
    dunstify "An error has occurred."
fi


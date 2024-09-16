#!/bin/bash

FILEPATH="$1"

HTMLPATH="$FILEPATH.html"

if $(cp "$FILEPATH" "$HTMLPATH"); then
    dunstify "Opening mail in xlinks..."
    xlinks -g "$HTMLPATH" &

    sleep 2 && rm "$HTMLPATH"
    dunstify "Removed HTML file."
else
    dunstify "An error has occurred."
fi


#!/bin/bash

xdotool type "$(grep -v '^#' ~/clipmark.txt | rofi -dmenu -theme "~/.config/rofi/launchers/type-1/style-7.rasi" -i -p 'Snippets' | cut -d' ' -f1)"

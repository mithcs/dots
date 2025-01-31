#!/bin/env bash

xdotool type "$(grep -v '^#' ~/clipmark.txt | rofi -dmenu -theme "$HOME/.config/rofi/launchers/type-1/style-7.rasi" -i -p 'Snippets' | cut -d' ' -f1)"

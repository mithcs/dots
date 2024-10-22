#!/bin/bash

# Texts directory
books_dir="$HOME/Reading"

# Get list of files
files="$(ls $books_dir)"

# Select STYLE and THEME
style="style-7"
theme="type-7"

# Path of rasi file
rasi="$HOME/.config/rofi/launchers/$theme/$style.rasi"

# Show the list of files in rofi
selected_file=$(echo "$files" | rofi -dmenu -theme "$rasi" -i -p "Select a file to open:")

# If file was selected then open it otherwise print error
if [[ -n "$selected_file" ]]; then
    dunstify "Opening $selected_file..."
    xdg-open "$books_dir/$selected_file"
    
    # Check if opened with success
    if [[ $? != 0 ]]; then
        dunstctl close
        dunstify "An error has occurred."
    fi
else
    dunstify "No file selected."
fi

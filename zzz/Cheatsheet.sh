#!/bin/bash

# Path of rasi file
rasi="$HOME/.config/rofi/dracula.rasi"

# Get prompt with rofi
get_prompt() {
    rofi -dmenu -theme "$rasi" -p "Enter prompt" -theme-str '#window {width: 500px;height: 50px;}'
}

# Get the input from user and store it
prompt=$(get_prompt)

if [ -z "$prompt" ]; then
    dunstify "No prompt entered."
    exit 1
else
    dunstify "Executing cht.sh with $prompt."
fi

# Execute cht.sh using bash and pipe it to less
st bash -c "cht.sh $prompt | less -R -N"

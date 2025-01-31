#!/bin/env bash

rasi="$HOME/.config/rofi/dracula.rasi"

# Get prompt with rofi
get_prompt() {
    rofi -dmenu -theme "$rasi" -p "Enter prompt" -theme-str '#window {width: 500px;height: 50px;}'
}

# Get the input from user and store it
prompt="$(get_prompt)"

if [[ -z "$prompt" ]]; then
    dunstify "No prompt entered."
    exit 1
else
    dunstify "Executing cht.sh with '$prompt'"
fi

# Final command to run
# TODO: change st to smtn dynamic here
st sh -c "cht.sh $prompt | less -R"

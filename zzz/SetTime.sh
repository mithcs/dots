#!/bin/bash

# This bash script retrieve the current date and time (from timeapi.io) and sets
# the retrieved date and time via `timedatectl`

# Depends on 'jq'


# Path of rasi file
rasi="$HOME/.config/rofi/dracula.rasi"

# Function to get password
get_password() {
    rofi -dmenu -theme "$rasi" -p "Enter your sudo password" -password -theme-str '#window {width: 400px;height: 50;}'
}

# Retrieve data from API
output=$(curl -s 'https://www.timeapi.io/api/time/current/zone?timeZone=Asia%2FKolkata')

if [[ $? -ne 0 ]]; then
    dunstify "Failed to retrieve data from timeapi.io"
    exit 1
fi

# Correctly parse data
year=$(echo "$output" | jq '.year')
month=$(echo "$output" | jq '.month')
day=$(echo "$output" | jq '.day')

hour=$(echo "$output" | jq '.hour')
minute=$(echo "$output" | jq '.minute')
seconds=$(echo "$output" | jq '.seconds')

datetime=$(printf "%04d-%02d-%02d %02d:%02d:%02d\n" "$year" "$month" "$day" "$hour" "$minute" "$seconds")

pass=$(get_password)

if [[ -z "$pass" ]]; then
    dunstify "Password input was cancelled."
    exit 1
fi

# Set the date and time
echo "$pass" | sudo -S timedatectl set-time "$datetime"

if [[ $? -eq 0 ]]; then
    dunstify "Date and time updated successfully"
else
    dunstify "Failed to set date and time"
    exit 1
fi

exit 0

#!/bin/bash

# This bash script retrieve the current date and time (from timeapi.io) and sets
# the retrieved date and time via `timedatectl`

# Function to get password
get_password() {
    rofi -dmenu -p "Enter your sudo password" -password
}

# Retrieve data from API
OUTPUT=$(curl -s 'https://www.timeapi.io/api/time/current/zone?timeZone=Asia%2FKolkata')

if [[ $? -ne 0 ]]; then
    dunstify "Failed to retrieve data from timeapi.io"
    exit 1
fi

# Correctly parse data
YEAR=$(echo "$OUTPUT" | jq '.year')
MONTH=$(echo "$OUTPUT" | jq '.month')
DAY=$(echo "$OUTPUT" | jq '.day')

HOUR=$(echo "$OUTPUT" | jq '.hour')
MINUTE=$(echo "$OUTPUT" | jq '.minute')
SECONDS=$(echo "$OUTPUT" | jq '.seconds')

DATETIME=$(printf "%04d-%02d-%02d %02d:%02d:%02d\n" "$YEAR" "$MONTH" "$DAY" "$HOUR" "$MINUTE" "$SECONDS")

PASS=$(get_password)

if [[ -z "$PASS" ]]; then
    dunstify "Password input was cancelled."
    exit 1
fi

# Set the date and time
echo "$PASS" | sudo -S timedatectl set-time "$DATETIME"

if [[ $? -eq 0 ]]; then
    dunstify "Date and time updated successfully"
else
    dunstify "Failed to set date and time"
    exit 1
fi

exit 0

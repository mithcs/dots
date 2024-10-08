#!/bin/bash

# Directory to save screenshots
screenshot_dir="$HOME/Pictures/Screenshots"

# Timestamp for unique filenames
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# File name for the screenshot
file_name="screenshot_$timestamp.jpg"

# Full path to the screenshot file
file_path="$screenshot_dir/$file_name"

# Take screenshot and save to clipboard
maim | xclip -selection clipboard -t image/png

# Notify
dunstify "Screenshot copied to clipboard!"

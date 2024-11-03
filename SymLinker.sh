#!/bin/bash

# This script is creates create symbolic links

# Current directory
CURRENT_DIR=$(pwd)

# Setup source and target pairs
declare -A LINKS=(
    ["$CURRENT_DIR/awesome"]="$HOME/.config/awesome"
    ["$CURRENT_DIR/nvim"]="$HOME/.config/nvim"
    ["$CURRENT_DIR/hypr"]="$HOME/.config/hypr"
    ["$CURRENT_DIR/i3"]="$HOME/.config/i3"
    ["$CURRENT_DIR/polybar"]="$HOME/.config/polybar"
    ["$CURRENT_DIR/rofi"]="$HOME/.config/rofi"
    ["$CURRENT_DIR/dunst"]="$HOME/.config/dunst"
    ["$CURRENT_DIR/.xinitrc"]="$HOME/.xinitrc"
    # ["$CURRENT_DIR/neomutt"]="$HOME/.config/neomutt"
    ["$CURRENT_DIR/Thunar"]="$HOME/.config/Thunar"
    ["$CURRENT_DIR/st"]="$HOME/.config/st"
    ["$CURRENT_DIR/zzz"]="$HOME/zzz"
    ["$CURRENT_DIR/.bashrc"]="$HOME/.bashrc"
    ["$CURRENT_DIR/.zshrc"]="$HOME/.zshrc"
)

# Iterate over each source-target pair
for SOURCE in "${!LINKS[@]}"; do
    TARGET="${LINKS[$SOURCE]}"

    # Verify SOURCE dir exists or not
    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source directory '$SOURCE' does not exist."
        continue
    fi

    # Check if TARGEt already exists or not
    if [ -e "$TARGET" ]; then
        echo "Error: Target '$TARGET' already exists."
        continue
    fi
    

    # Core command for creating symbolic links
    ln -s "$SOURCE" "$TARGET"


    # Verify the link creation
    if [ $? -eq 0 ]; then
        echo "Symbolic link created: $SOURCE -> $TARGET"
    else
        echo "Error: Failed to create symbolic link for '$SOURCE'."
    fi
done

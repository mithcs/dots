#!/usr/bin/bash

# This is an example command to invoke this script using 'rofi'. The script is run in 'find' mode.

# Check if the script has the --launch argument
if [ "$1" == "--launch" ]; then
    # Select STYLE and THEME
    STYLE="style-5"
    THEME="type-4"

    # Path of rasi file
    RASI="$HOME/.config/rofi/launchers/$THEME/$STYLE.rasi"

    # Get the path of the current script
    SCRIPT_PATH=$(realpath "$0")

    # Execute the rofi command with the find mode and current script
    rofi -show find -modi find:$SCRIPT_PATH -theme "$RASI"
    exit
fi

EXCLUDE="{MyEnv,.local,.cache,.local,.npm,.nvim,.zprezto,.config/chromium,go/pkg/mod,/.git}"

# Check if any arguments were passed to the script.
if [ ! -z "$@" ]
then
    # Store the arguments in the QUERY variable.
    QUERY=$@

    # Check if the query starts with a forward slash, indicating a file path.
    if [[ "$@" == /* ]]
    then
        # If the query ends with '??', open the directory containing the file.
        if [[ "$@" == */ ]]
        then
            # The 'QUERY%\/*' part removes the '??' from the end of the path.
            thunar "${QUERY}"  > /dev/null 2>&1 &
            exec 1>&-  # Close the file descriptor for stdout.
            exit;      # Exit the script.
        else
            # Open files with specific applications based on file type
            case "${QUERY##*.}" in
                txt|sh|lua|conf|cpp|c|go|qml|html)
                    # Open files with Neovim
                    st -e nvim "$@" > /dev/null 2>&1 &
                    ;;
                pdf)
                    # Open PDFs with evince
                    evince "$@" > /dev/null 2>&1 &
                    ;;
                *)
                    # Open executables
                    if [ -x "$@" ]; then
                        "$@" > /dev/null 2>&1 &
                    else
                        xdg-open "$@" > /dev/null 2>&1 &
                    fi
                    ;;
            esac
            exit
        fi

    # Check if the query starts with '!!', which is a special command to show help.
    elif [[ "$@" == \!\!* ]]
    then
        # Print help instructions to the terminal.
        echo "!!-- Type your search query to find files"
        echo "!!-- To search again type !<search_query>"
        echo "!!-- To search parent directories type ?<search_query>"
        echo "!!-- You can print this help by typing !!"

    # Check if the query starts with '?', indicating a parent directory search.
    elif [[ "$@" == \?* ]]
    then
        # Perform a search in the home directory for directories matching the query using fd.
        # Process each line of the fd output directly.
        fd --type directory -j 2 --hidden --exclude "$EXCLUDE" --search-path ~ "${QUERY#\?}"

    else
        # Perform a standard search for files matching the query using fd.
        # The 'fd' command excludes hidden directories and files by default.
        fd --type file -j 2 --hidden --exclude "$EXCLUDE" --search-path ~ "${QUERY#!}"
    fi

else
    # If no arguments were provided, print a fortune that has pairs of (country-capital)s.
    echo "$(fortune Country-Caps)"
fi

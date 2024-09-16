#!/bin/bash

if startx
then
    dunstify hi
else
    startx
    exec dwm &
fi

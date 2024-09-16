#!/bin/bash

text=$(xclip -out -selection primary)

if grep $text /home/veloXm/clipmark.txt
then
    dunstify "$text is already in clipmark."
else
    echo "$text" >> /home/veloXm/clipmark.txt
    dunstify "$text is added to clipmark."
fi

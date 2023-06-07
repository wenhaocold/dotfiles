#!/bin/bash

yabai -m window --toggle zoom-fullscreen
is_fullscreen=$(yabai -m query --windows --window  | jq '."has-fullscreen-zoom"')

if [[ $is_fullscreen == "true" ]]; then
    yabai -m window --opacity 0.88
    echo $is_fullscreen
else
    yabai -m window --opacity 1.0 
    echo $is_fullscreen
fi

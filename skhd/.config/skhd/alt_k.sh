#!/bin/bash


cur_layout=$(yabai -m query --spaces --space | jq --raw-output '.type')

if [[ "$cur_layout" == "bsp" ]]
then
    yabai -m window --focus north
elif [[ "$cur_layout" == "stack" ]]
then
    window=$(yabai -m query --windows --window stack.prev | jq '.id')
    if [[ -n $window ]]; then
        window="stack.prev"
    else
        window="stack.last"
    fi
    yabai -m window --focus $window
fi


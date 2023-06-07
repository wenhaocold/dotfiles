#!/bin/bash


cur_layout=$(yabai -m query --spaces --space | jq --raw-output '.type')

if [[ "$cur_layout" == "bsp" ]]
then
    yabai -m window --focus south
elif [[ "$cur_layout" == "stack" ]]
then
    window=$(yabai -m query --windows --window stack.next | jq '.id')
    if [[ -n $window ]]; then
        window="stack.next"
    else
        window="stack.first"
    fi
    yabai -m window --focus $window
fi


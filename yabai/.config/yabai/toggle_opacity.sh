#!/bin/bash

cur_layout=$(yabai -m query --spaces --space | jq --raw-output '.type')

if [[ "$cur_layout" == "bsp" ]]
then
    yabai -m config window_opacity on
elif [[ "$cur_layout" == "stack" ]]
then
    yabai -m config window_opacity off
fi

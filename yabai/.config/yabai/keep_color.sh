#!/bin/bash

# The border color is a global config. We change the global color when space's layout changes.
# So we need to keep other spaces border color when change these space.

source $HOME/.config/yabai/color.sh

cur_layout=$(yabai -m query --spaces --space | jq --raw-output '.type')

if [[ "$cur_layout" == "bsp" ]]
then
    border_color=$bsp_border_color
elif [[ "$cur_layout" == "stack" ]]
then
    border_color=$stack_border_color
else
    border_color=""
fi


if [[ $border_color != "" ]]; then
    yabai -m config active_window_border_color $border_color
fi



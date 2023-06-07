#!/bin/bash


# default_color=0xFFFFFFFF
# if [[ -f $HOME/.config/yabai/color.sh ]]
# then
#     source $HOME/.config/yabai/color.sh
# else
#     bsp_border_color=$default_color
#     stack_border_color=$default_color
# fi

cur_layout=$(yabai -m query --spaces --space | jq --raw-output '.type')

if [[ "$cur_layout" == "bsp" ]]
then
    cur_layout="stack"
    # border_color=$stack_border_color
elif [[ "$cur_layout" == "stack" ]]
then
    cur_layout="bsp"
    # border_color=$bsp_border_color
else
    cur_layout=""
fi

if [[ $cur_layout != "" ]]; then
    yabai -m space --layout $cur_layout
    # yabai -m config active_window_border_color $border_color
fi

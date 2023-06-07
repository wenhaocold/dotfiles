#!/bin/bash

has_border=$(yabai -m query --windows --window  | jq --raw-output '."has-border"')
is_floating=$(yabai -m query --windows --window  | jq --raw-output '."is-floating"')

if [[ $is_floating == "true" ]]; then
    yabai -m window --toggle float
else
    yabai -m window --opacity 1.0 
fi

yabai -m window --toggle float


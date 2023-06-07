#!/bin/bash

display=$(yabai -m query --displays --display prev | jq '.id')
if [[ -n $display ]]; then
    display="prev"
else
    display="last"
fi

echo $display
yabai -m display --focus $display

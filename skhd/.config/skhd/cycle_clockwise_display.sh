#!/bin/bash

display=$(yabai -m query --displays --display next | jq '.id')
if [[ -n $display ]]; then
    display="next"
else
    display="first"
fi

echo $display
yabai -m display --focus $display

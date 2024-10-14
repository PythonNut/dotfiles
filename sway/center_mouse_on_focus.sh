#!/bin/bash
eval $(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "X=\(.x+.width/2);Y=\(.y+.height/2)"')
swaymsg seat - cursor set $X $Y

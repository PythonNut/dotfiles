#!/bin/bash

# Get the current workspace number
current_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Get the previous workspace number on the same output
previous_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.output=="'$(swaymsg -t get_outputs | jq -r '.[] | select(.active==true).name')'") | .name' | grep -B 1 "$current_workspace" | head -n 1)

# Check if the previous workspace is valid
if [ -z "$previous_workspace" ]; then
  echo "No previous workspace found on the same output."
  exit 1
fi

# Rename the workspaces to swap their numbers
swaymsg rename workspace "$current_workspace" to temp
swaymsg rename workspace "$previous_workspace" to "$current_workspace"
swaymsg rename workspace temp to "$previous_workspace"

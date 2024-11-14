# Get the current workspace number
current_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Get the next workspace number on the same output
next_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.output=="'$(swaymsg -t get_outputs | jq -r '.[] | select(.active==true).name')'") | .name' | grep -A 1 "$current_workspace" | tail -n 1)

# Check if the next workspace is valid
if [ -z "$next_workspace" ]; then
  echo "No next workspace found on the same output."
  exit 1
fi

# Rename the workspaces to swap their numbers
swaymsg rename workspace "$current_workspace" to temp
swaymsg rename workspace "$next_workspace" to "$current_workspace"
swaymsg rename workspace temp to "$next_workspace"

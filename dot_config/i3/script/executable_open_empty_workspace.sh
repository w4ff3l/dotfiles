#!/bin/bash

current_display_output=$(i3-msg -t get_workspaces | jq '.[] | select( .focused ) | .output')
index_last_workspace=$(i3-msg -t get_workspaces | jq 'map( select( .output == '"${current_display_output}"' ) ) | sort_by(.num) | last | .num')
empty_workspace=$((index_last_workspace + 1))
echo "$empty_workspace"
i3-msg workspace "$empty_workspace"

# Alternative without jq
# i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | sed "1 d" | head -1) + 1))


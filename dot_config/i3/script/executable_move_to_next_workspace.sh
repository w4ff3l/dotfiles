#!/bin/bash

current_display_output=$(i3-msg -t get_workspaces | jq '.[] | select( .focused ) | .output')
index_last_workspace=$(i3-msg -t get_workspaces | jq 'map( select( .output == '"${current_display_output}"' ) ) | sort_by(.id) | last | .num')

if [[ $1 == "next" ]]; then
    target_workspace=$((index_last_workspace + 1))
    echo "$target_workspace"
fi

if [[ $1 == "previous" ]]; then
    target_workspace=$((index_last_workspace - 1))
fi

i3-msg move container to workspace number $target_workspace
i3-msg workspace number $target_workspace

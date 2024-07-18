#!/bin/bash

focused_workspace=$(i3-msg -t get_workspaces | jq '.[] | select( .focused ) | .num')

if [[ $1 == "next" ]]; then
    target_workspace=$((focused_workspace + 1))
fi

if [[ $1 == "previous" ]]; then
    target_workspace=$((focused_workspace - 1))
fi

i3-msg move container to workspace number $target_workspace
i3-msg workspace number $target_workspace

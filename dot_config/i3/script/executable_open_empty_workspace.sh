#!/bin/bash

i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | sed "1 d" | head -1) + 1))

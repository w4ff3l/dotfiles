#!/bin/bash

DIR="$HOME/.config/polybar"
BAR="i3_bar"

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -q $BAR -c "$DIR"/config.ini &
  done
else
  polybar -q $BAR -c "$DIR"/config.ini &
fi

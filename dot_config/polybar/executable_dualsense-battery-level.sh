#! /bin/bash

BATTERY_LEVEL=$(dualsensectl battery | awk '{ print $1 }' -)

if ! [[ $BATTERY_LEVEL =~ ^-?[0-9]+$ ]]; then
    polybar-msg action "#bluetooth-battery.module_hide" > /dev/null 2>&1
else
    polybar-msg action "#bluetooth-battery.module_show" > /dev/null 2>&1
    echo $BATTERY_LEVEL
fi

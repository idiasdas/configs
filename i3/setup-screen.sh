#!/usr/bin/env bash

xrandr --output eDP-1 --primary --auto
monitors="HDMI-1 HDMI-1-0 DP-1 DP-1-0"
for monitor in $monitors; do
    # echo $monitor
    if [[ -n $(xrandr | grep " connected" | grep -E "^$monitor ") ]]; then
        xrandr --output eDP-1 --noprimary
        xrandr --output eDP-1 --off
        xrandr --output $monitor --primary --auto
        break
    fi
done

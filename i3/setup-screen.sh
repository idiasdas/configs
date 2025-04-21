#!/usr/bin/env bash

if [[ -n $(xrandr | grep " connected" | grep -E "HDMI-1-0") ]]; then
    xrandr --output eDP-1 --off
    xrandr --output HDMI-1-0 --primary
elif [[ -n $(xrandr | grep " connected" | grep -E "DP-1-0") ]]; then
    xrandr --output eDP-1 --off
    xrandr --output DP-1-0 --primary
fi

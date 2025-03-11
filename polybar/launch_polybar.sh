#!/usr/bin/env bash

# # Terminate already running bar instances
# # If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# # Otherwise you can use the nuclear option:
# killall -q polybar
#

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    bar=$(xrandr --query | grep $m | [[ -z $(grep " primary") ]] && echo "mybar_notray" || echo "mybar")
    MONITOR=$m polybar $bar --config=$HOME/configs/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
  done
else
    tray_position="right"
    polybar mybar --config=$HOME/configs/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
fi

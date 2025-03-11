#!/usr/bin/env bash

# # Terminate already running bar instances
# # If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# # Otherwise you can use the nuclear option:
# killall -q polybar
#

bar=mybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar $bar 2>&1 | tee -a /tmp/polybar.log & disown
  done
else
   polybar $bar 2>&1 | tee -a /tmp/polybar.log & disown
fi

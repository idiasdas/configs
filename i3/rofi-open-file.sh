#!/bin/bash

# Fuzzy search files in home and open with default application
file=$(fdfind . $HOME | rofi -dmenu \
    -i \
    -p "Open file:" \
    -float-window \
    -theme-str 'window { width: 80%; } listview { lines: 30; columns: 1;} * { font: "monospace 13"; } element { padding: 6px; }')

if [[ -n "$file" ]]; then
    xdg-open "$file" >/dev/null 2>&1 &
fi

#!/usr/bin/env bash

if [[ -f $HOME/Pictures/wallpaper.png ]]; then
    i3lock -e --noinput-text="" --verif-text="" --wrong-text="" --ind-pos="x + 40:h - 40" --radius 30 \
        --image $HOME/Pictures/wallpaper.png --inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
        --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
        --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
        --ringver-color=ffffffff --ringwrong-color=ffffffff \
        -F
else
    i3lock -e --noinput-text="" --verif-text="" --wrong-text="" --ind-pos="x + 40:h - 40" --radius 30 \
        --color 000000 \
        --inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
        --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
        --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
        --ringver-color=ffffffff --ringwrong-color=ffffffff
fi


#!/usr/bin/env bash

script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
filter=""
dry="0"

while [[ $# > 0 ]]; do
    if [[ $1 == "--dry" ]]; then
        dry="1"
    else
        filter="$1"
    fi
    shift
done

log(){
    if [[ $dry == "1" ]]; then
        echo "[DRY RUN]: $@"
    else
        echo "$@"
    fi
}

execute(){
    log "[EXECUTE]: $@"
    if [[ $dry == "1" ]]; then
        return
    fi
    "$@"
}

log "Remove previous configurations"

execute rm $HOME/.bashrc
execute rm $HOME/.profile
execute rm $HOME/.git_prompt
execute rm $HOME/.bash_alias
execute rm $HOME/.tmux.conf
execute rm -r $HOME/.config/nvim
execute rm -r $HOME/.config/i3
execute rm -r $HOME/.config/polybar
execute rm -r $HOME/.config/rofi

log "Create symbolic links to config"

execute ln -s -T $PWD/bashrc/bashrc $HOME/.bashrc
execute ln -s -T $PWD/bashrc/profile $HOME/.profile
execute ln -s -T $PWD/bashrc/git_prompt $HOME/.git_prompt
execute ln -s -T $PWD/bashrc/bash_alias $HOME/.bash_alias
execute ln -s -T $PWD/tmux/tmux.conf $HOME/.tmux.conf
execute ln -s -T $PWD/nvim $HOME/.config/nvim
execute ln -s -T $PWD/i3 $HOME/.config/i3
execute ln -s -T $PWD/polybar $HOME/.config/polybar
execute ln -s -T $PWD/rofi $HOME/.config/rofi

log "Done"

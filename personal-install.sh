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

log "$script_dir -- $filter"


cd $script_dir
scripts=$(find ./install-scripts -maxdepth 1 -mindepth 1 -executable -type f)

for script in $scripts; do
    if echo "$script" | grep -qv "$filter"; then
        log "Filtering -- $script"
        continue
    fi

    execute ./$script
done

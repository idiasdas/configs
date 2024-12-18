# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window Size

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Setup pretty bash prompt

function parse_conda_env () {
    if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then
        echo "$CONDA_DEFAULT_ENV"
    fi
}

source ~/.git_prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

ORANGE="\033[38;5;214m"
GREEN="\033[01;32m"
BLUE="\033[01;34m"
RESET_COLOR="\033[00m"

parse_conda_env () {
    if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then
        echo "<$(basename "$CONDA_DEFAULT_ENV")>"
    fi
}

set_prompt_all() {
    PS1="\[$ORANGE\]$(parse_conda_env)\[$GREEN\]$(__git_ps1 "( %s)")\[$BLUE\][\w]\[$RESET_COLOR\]\$ "
}

PROMPT_COMMAND=set_prompt_all
# Enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/idiasdas/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/idiasdas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/idiasdas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/idiasdas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Personal

export PATH="$HOME/neovim/bin:$PATH"
export PATH="$HOME/configs/scripts:$PATH"
set -o vi
alias wk='tmux-work'

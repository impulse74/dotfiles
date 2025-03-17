#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
PS1='\[\e[32m\]\u@\h\[\e[0m\]\[\e[34m\] \W \$ \[\e[0m\]'

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi

# Created by `pipx` on 2025-03-10 13:24:32
export PATH="$PATH:/home/ace/.local/bin"

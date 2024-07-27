# ~/.bashrc

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit;}

# Alias
alias v=nvim
alias py=python
alias l='ls -la'
alias q=exit
alias mi='cd ~/School/Methodiek\ van\ de\ Informatica/'
alias vmi='v ~/School/Methodiek\ van\ de\ Informatica/'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

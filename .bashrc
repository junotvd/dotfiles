# ~/.bashrc

# [ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit;}

export EDITOR=nvim
export VISUAL=nvim

# Alias
alias v=nvim
alias py=python
alias l='ls -la'
alias q=exit
alias mi='cd ~/school/ingenieurswetenschappen/Methodiek\ van\ de\ Informatica/'
alias ff=fastfetch
alias dot='cd ~/dotfiles/'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

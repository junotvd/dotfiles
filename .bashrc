# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


eval "$(fzf --bash)"
eval "$(starship init bash)"

export EDITOR=nvim
export VISUAL=nvim

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=$PATH:~/.cargo/bin
. "$HOME/.cargo/env"
export PATH=$HOME/.local/bin:$PATH

# Alias
alias v=nvim
alias py=python
alias l='ls -la'
alias q=exit
alias mi='cd ~/school/ingenieurswetenschappen/Methodiek\ van\ de\ Informatica/'
alias ff=fastfetch
alias dot='cd ~/dotfiles/'
alias inv='nvim $(fzf -m --preview"bat --color=always {}")'


alias ls='ls --color=auto'
alias grep='grep --color=auto'

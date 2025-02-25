# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(fzf --bash)"
eval "$(starship init bash)"
set -o vi

export PATH="${PATH}:${HOME}/bin"

export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# alias
alias v=nvim
alias py=python
alias l='ls -la'
alias q=exit

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias pdf='firefox http://100.124.103.23:8080/'
alias print='firefox https://print.kuleuven.be/app?service=page/UserWebPrint'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Created by `pipx` on 2024-12-23 10:05:10
export PATH="$PATH:/home/junot/.local/bin"

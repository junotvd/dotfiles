# ~/.bashrc

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

eval "$(starship init bash)"

export PATH="${PATH}:${HOME}/bin"
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL=alacritty
export PDF_VIEWER=zathura
export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export MANPAGER="nvim +Man!"

eval "$(fzf --bash)"
set -o vi

# alias
alias v=nvim
alias vo="NVIM_APPNAME=nvim-old nvim"
alias vv="NVIM_APPNAME=nvim-nov nvim"
alias py=python
alias l='ls -la'
alias q=exit

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias pdf='firefox http://100.124.103.23:8080/'
alias print='firefox https://print.kuleuven.be/app?service=page/UserWebPrint'
alias apollo='firefox https://apollo.saga-pollux.ts.net/'

alias lualatex='lualatex -interaction nonstopmode'

cd() {
	if [ $# -eq 0 ]; then
		if [ -n "$TMUX" ]; then
			root=$(tmux show-environment TMUX_SESSION_ROOT 2>/dev/null | cut -d= -f2-)
			if [ -n "$root" ]; then
				builtin cd "$root"
				return
			fi
		fi
		builtin cd ~
	else
		builtin cd "$@"
	fi
}

# Created by `pipx` on 2024-12-23 10:05:10
export PATH="$PATH:/home/junot/.local/bin"

[ -f "/home/junot/.ghcup/env" ] && . "/home/junot/.ghcup/env" # ghcup-env

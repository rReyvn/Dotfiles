#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
. "$HOME/.cargo/env"
. "$HOME/.asdf/plugins/golang/set-env.bash"

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[32m\]\u@\h \[\e[1;34m\]\w \[\e[31m\]>\[\e[33m\]>\[\e[32m\]> \[\e[00m\]'

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

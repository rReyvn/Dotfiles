# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[32m\]\u@\h \[\e[1;34m\]\w \[\e[31m\]>\[\e[33m\]>\[\e[32m\]> \[\e[00m\]'

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Tool & Language Environments
export RUSTUP_HOME="$HOME/.dot/rustup"
export CARGO_HOME="$HOME/.dot/cargo"
export NPM_CONFIG_PREFIX="$HOME/.dot/npm-global"
export NPM_CONFIG_CACHE="$HOME/.dot/npm-cache"
export DENO_INSTALL_ROOT="$HOME/.dot/deno"
export BUN_INSTALL="$HOME/.dot/bun"
export IPYTHONDIR="$HOME/.dot/ipython"
export DOTNET_CLI_HOME="$HOME/.dot/dotnet/cli"
export PYENV_ROOT="$HOME/.dot/pyenv"
export FVM_CACHE_PATH="$HOME/.dot/fvm"
export PUB_CACHE="$HOME/.dot/pub-cache"
export FLUTTER_HOME="$FVM_CACHE_PATH/default"
export ANDROID_HOME="$HOME/.dot/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/.dot/Android/Sdk"
export ANDROID_CMD_TOOLS="$ANDROID_HOME/platform-tools/bin"

# Path additions
for dir in \
    "$HOME/.local/bin" \
    "$NPM_CONFIG_PREFIX/bin" \
    "$BUN_INSTALL/bin" \
    "$CARGO_HOME/bin" \
    "$DENO_INSTALL_ROOT/bin" \
    "$FLUTTER_HOME/bin" \
    "$ANDROID_CMD_TOOLS"; do
    if [[ -d "$dir" ]] && [[ ":$PATH:" != *":$dir:"* ]]; then
        PATH="$dir:$PATH"
    fi
done
export PATH

export MANPATH="$XDG_DATA_HOME/man:$MANPATH"

# Environment hooks
if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env --use-on-cd --shell bash)"
fi

if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx WGETRC $XDG_CONFIG_HOME/wgetrc

set -gx RUSTUP_HOME $HOME/.dot/rustup
set -gx CARGO_HOME $HOME/.dot/cargo
set -gx NPM_CONFIG_PREFIX $HOME/.dot/npm-global
set -gx NPM_CONFIG_CACHE $HOME/.dot/npm-cache
set -gx DENO_INSTALL_ROOT $HOME/.dot/deno
set -gx BUN_INSTALL $HOME/.dot/bun
set -gx IPYTHONDIR $HOME/.dot/ipython
set -gx DOTNET_CLI_HOME $HOME/.dot/dotnet/cli
set -Ux PYENV_ROOT $HOME/.dot/pyenv
set -gx FLUTTER_ROOT $HOME/Dev/Mobile/flutter/bin
set -gx ANDROID_HOME $HOME/Dev/Mobile/android/sdk

for dir in $HOME/.local/bin $NPM_CONFIG_PREFIX/bin $BUN_INSTALL/bin $CARGO_HOME/bin $DENO_INSTALL_ROOT/bin/ $FLUTTER_ROOT $ANDROID_HOME/platform-tools
    if test -d $dir; and not contains -- $dir $PATH
        set -p PATH $dir
    end
end

fnm env --use-on-cd --shell fish | source
direnv hook fish | source

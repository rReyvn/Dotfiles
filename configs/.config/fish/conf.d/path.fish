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
set -gx FVM_CACHE_PATH $HOME/.dot/fvm
set -gx PUB_CACHE $HOME/.dot/pub-cache
set -gx FLUTTER_HOME $FVM_CACHE_PATH/default
set -gx ANDROID_HOME $HOME/.dot/android
set -gx ANDROID_CMD_TOOLS $ANDROID_HOME/cmdline-tools/latest/bin
set -gx ANDROID_PLATFORM_TOOLS $ANDROID_HOME/platform-tools

for dir in $HOME/.local/bin $NPM_CONFIG_PREFIX/bin $BUN_INSTALL/bin $CARGO_HOME/bin $DENO_INSTALL_ROOT/bin $FLUTTER_HOME/bin $ANDROID_CMD_TOOLS $ANDROID_PLATFORM_TOOLS
    if test -d $dir; and not contains -- $dir $PATH
        set -p PATH $dir
    end
end

if type -q fnm
  fnm env --use-on-cd --shell fish | source
else
  echo (set_color red)"[x] "(set_color normal)"missing fnm"
end

if type -q direnv
  direnv hook fish | source
else
  echo (set_color red)"[x] "(set_color normal)"missing direnv"
end

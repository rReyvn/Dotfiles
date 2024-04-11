set -U FZF_DEFAULT_OPTS "\
  --height 60%\
  --border"

set -U FZF_ALT_C_COMMAND "fd -t d . \$dir"
set -U FZF_ALT_C_OPTS " \
  --preview 'eza -aT --sort=modified --level=3 --color=always --git-ignore {}'\
  "

set -U FZF_CTRL_T_COMMAND "rg --files --no-require-git"
set -U FZF_CTRL_T_OPTS " \
  --preview 'bat \
  --color=always {}' \
  "

set -U FZF_CTRL_R_OPTS " \
  --preview 'echo {}' \
  "

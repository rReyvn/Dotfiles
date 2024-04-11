if type -q fzf
    fzf --fish | source

    set -U FZF_DEFAULT_OPTS "\
    --height 60%\
    --color=pointer:#6791C9\
    --border"

    set -U FZF_ALT_C_COMMAND "fd -t d . \$dir"
    set -U FZF_ALT_C_OPTS " \
    --prompt '󰙁 Directory ➤ '\
    --preview 'eza -aT --sort=modified --level=3 --color=always --git-ignore {}'\
    "

    set -U FZF_CTRL_T_COMMAND "rg --files --no-require-git"
    set -U FZF_CTRL_T_OPTS " \
    --prompt ' Files ➤ '\
    --preview 'bat \
    --color=always {}' \
    "

    set -U FZF_CTRL_R_OPTS "
    --prompt '󰋚 History ➤ '\
  "

    function fzf_hidden_cd
        set -l fzf_cmd "fd -t d -H . \$dir"

        set -l selection (eval $fzf_cmd | fzf --height 80% \
      --color=pointer:#6791C9 \
      --layout=reverse --border \
      --prompt '󰙁 Directory ➤ ' \
      --preview 'eza -aT --sort=modified --level=3 --color=always --git-ignore {}')

        if test -n "$selection"
            cd "$selection"
        end
    end

    # Bind Alt+Shift+C to cd hidden directory
    bind \eC 'fzf_hidden_cd; commandline -f repaint'
else
    echo (set_color red)"[x] "(set_color normal)"fzf not found"
end

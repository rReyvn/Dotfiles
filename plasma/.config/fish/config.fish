if status is-interactive
  fish_add_path ~/.local/bin

  set -gx --prepend ASDF_DATA_DIR "$HOME/.local/share/asdf"

  if test -z "$ASDF_DATA_DIR"
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
  
  zoxide init fish | source
else
  exit
end

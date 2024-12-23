if status is-interactive
  fish_add_path ~/.local/bin
  fish_add_path ~/.cargo/bin
  
  source ~/.asdf/asdf.fish
  zoxide init fish | source
else
  exit
end

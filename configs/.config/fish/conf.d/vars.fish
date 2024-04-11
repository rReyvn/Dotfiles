# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Env
set -gx DOTFILES_DIR ~/Dev/Dotfiles/
set -gx NTFS_HDD_DIR /mnt/hdd/
set -gx LINUX_HDD_DIR /mnt/linux-hdd/
set -gx TERM xterm-256color
set -gx EDITOR nvim

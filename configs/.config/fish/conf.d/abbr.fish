abbr k 'kitten ssh'
abbr nv nvim
abbr lg lazygit
abbr te trash-empty
abbr hw 'hwinfo --short'
abbr pacgit 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
abbr pacsize 'pacman -Qi | awk \'/^Name/{name=$3} /^Installed Size/{print $4$5, name}\' | sort -h' # Sort installed packages according to size in MB
abbr jctl 'journalctl -p 3 -xb' # Show Error Message on Journalctl
abbr ff fastfetch

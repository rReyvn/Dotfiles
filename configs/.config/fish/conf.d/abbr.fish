abbr k 'kitten ssh'
abbr nv nvim
abbr nvc 'nvim --clean'
abbr lg lazygit
abbr te trash-empty
abbr hw 'hwinfo --short'

abbr pacgit 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
abbr pacsize 'pacman -Qi | awk \'/^Name/{name=$3} /^Installed Size/{print $4$5, name}\' | sort -h' # Sort installed packages according to size in MB
abbr pacfix 'sudo rm /var/lib/pacman/db.lck' # Fix pacman
abbr paccleanup 'paru -Rnc (paru -Qtdq)' # Cleanup orphaned packages
abbr pacmirrors 'sudo cachyos-rate-mirrors' # Rate Pacman Mirros
abbr jctl 'journalctl -p 3 -xb' # Show Error Message on Journalctl
abbr ff fastfetch

abbr py python
abbr cmpsr 'docker run --rm -v $(pwd):/app --user $(id -u):$(id -g) composer'
abbr sail-cmpsr 'docker run --rm --pull=always -v "$(pwd)":/opt -w /opt laravelsail/php84-composer:latest bash -c "laravel new example-app --no-interaction && cd example-app && php ./artisan sail:install --with=mysql,redis,meilisearch,mailpit,selenium"'

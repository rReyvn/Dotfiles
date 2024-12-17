# GENERAL SETUP

- SSH Setup

  - Generate SSH Key
    ```sh
    ssh-keygen -t ed25519 -f <ssh_file_name> -C <EMAIL_STRING>
    ssh-agent -s
    ssh-add .ssh/<ssh_file_name_alt_account>
    ```
  - Setup SSH Key to Github
  - Create ssh config file (Default: ~/.ssh/config)

    ```
    Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/<ssh_file_name>
        IdentitiesOnly yes

    Host github.com-alt
        HostName github.com
        User git
        IdentityFile ~/.ssh/<ssh_file_name_alt>
        IdentitiesOnly yes
    ```

- Apps, Code Editor, and IDE
  `paru -S - < apps.txt --needed`

  > Intellij Idea can also be installed via jetbrains-toolbox

- Utilities
  `paru -S - < utils.txt --needed`

- Flatpak Setup & Apps

  ```
  paru -S flatpak
  flatpak install flathub com.obsproject.Studio
  ```

- Virtual Machine Setup

  `paru -S - < virt.txt --needed`

  Start Service

  ```
  sudo systemctl enable libvirtd --now
  sudo systemctl enable virtnetworkd --now
  ```

  Add user account to libvirt group

  ```
  sudo usermod -a -G libvirt $(whoami)
  newgrp libvirt
  ```

- Misc

  - Wifi driver fix
    `paru -S rtl8821ce-dkms-git`
  - Sync dual-boot bluetooth devices
    ```
    paru -S python-pipx chntpw
    pipx install bt-dualboot
    sudo ~/.local/bin/bt-dualboot --sync-all --backup
    ```
  - Fonts
    `paru -S - < fonts.txt --needed`
    
  - [Bibata-cursor](https://www.bibata.live/studio)
  - Hide application from showing up on application runner
    Put `NoDisplay=true` on desktop entries file & update desktop database using `update-desktop-database ~/.local/share/applications/` 
    or `sudo update-desktop-database /usr/share/applications/`

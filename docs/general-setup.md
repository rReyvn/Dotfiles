# GENERAL SETUP

- SSH Setup

  - Generate SSH Key
    ```sh
    ssh-keygen -t ed25519 -f <ssh_file_name> -C <EMAIL_STRING>
    eval `ssh-agent -s`
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

- Apps
  `yay -S brave-bin visual-studio-code-bin obsidian vesktop-bin neovide prismlauncher-qt5-bin zed vulkan-radeon intellij-idea-community-edition`

- Utilities
  `yay -S syncthing docker docker-rootless-extras docker-compose distrobox ncdu`

- Flatpak Setup

  ```
  yay -S flatpak
  flatpak install flathub com.obsproject.Studio
  ```

- Misc

  - Wifi driver fix
    `yay -S rtl8821ce-dkms-git`
  - Soft lock fix
    `yay -S disable-c6-systemd`
  - Sync dual-boot bluetooth devices
    ```
    yay -S python-pipx
    pipx install bt-dualboot
    ```
  - Fonts
    ```
    yay -S inter-font ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-ms-fonts \
    ttf-nerd-fonts-symbols-mono ttf-font-awesome otf-font-awesome ttf-jetbrains-mono-nerd --needed
    ```
  - [Bibata-cursor](https://www.bibata.live/studio)
  - Mount HDD

    ```sh
    sudo blkid # Check HDD UUID
    sudo mkdir /mnt/HDD
    # Add this to /etc/fstab
    UUID=<HDD-UUID> /mnt/HDD ntfs-3g x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133 0 0
    ```

  - Environtment Variables

    ```
    # Add this to /etc/environment
    BROWSER=/usr/bin/firefox
    EDITOR=/usr/bin/nvim
    TERMINAL=/usr/bin/kitty

    # Only if using docker-rootless
    DOCKER_HOST=unix:///run/user/1000/docker.sock
    ```

  - Silent Boot

    ```
    # Add this to kernel parameter
    quiet loglevel=3 systemd.show_status=auto rd.udev.log_level=3
    ```

  - Change default file manager to nautilus
    ```
    xdg-mime default org.gnome.Nautilus.desktop inode/directory
    ```

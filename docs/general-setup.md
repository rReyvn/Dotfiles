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

- Apps
  `paru -S brave-bin visual-studio-code-bin obsidian vesktop-bin neovide zed vulkan-radeon intellij-idea-community-edition`

- Utilities
  `paru -S syncthing docker docker-rootless-extras docker-compose distrobox ncdu`

- Flatpak Setup

  ```
  paru -S flatpak
  flatpak install flathub com.obsproject.Studio
  ```

- Virtual Machine Setup

  ```
  paru -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables
  ```

  Start Service

  ```
  sudo systemctl enable libvirtd --now
  sudo systemctl enable virtnetworkd --now
  ```

  Commented out from /etc/libvirt/libvirt.conf

  ```
  unix_sock_group = "libvirt"
  unix_sock_rw_perms = "0770"
  ```

  Add user account to libvirt group

  ```
  sudo usermod -a -G libvirt $(whoami)
  newgrp libvirt
  ```

  Restart libvirt daemon

  ```
  sudo systemctl restart libvirtd
  ```

- Misc

  - Wifi driver fix
    `paru -S rtl8821ce-dkms-git`
  - Soft lock fix
    `paru -S disable-c6-systemd`
  - Sync dual-boot bluetooth devices
    ```
    paru -S python-pipx
    pipx install bt-dualboot
    ```
  - Fonts
    ```
    paru -S inter-font ttf-jetbrains-mono-nerd nerd-fonts-inter ttf-ms-win11-auto --needed
    ```
  - Glyphs support for non-nerd fonts
    ```
    paru -S ttf-font-awesome otf-font-awesome ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono --needed
    ```
  - [Bibata-cursor](https://www.bibata.live/studio)
  - Mount HDD
    ```sh
    sudo blkid # Check Disk UUID
    sudo mkdir /mnt/HDD
    sudo mkdir /mnt/win
    # Add this to /etc/fstab
    UUID=<PARTITION-UUID>                     /mnt/win/      ntfs-3g x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133,nofail,noauto 0 0
    UUID=<HDD-UUID>                           /mnt/HDD       ntfs-3g x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133 0 0
    ```
  - Environtment Variables

    ```
    # Add this to /etc/environment
    BROWSER=/usr/bin/brave
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
  - Secure Boot Setup
    ```
    paru -S sbctl
    ```
    Reboot to firmware setting and clear secure boot key then boot to linux
    ```
    sudo sbctl status
    sudo sbctl create-keys
    sudo sbctl enroll-keys -m
    sudo sbctl status
    ```
    Sign kernel image & boot loader
    ```
    sudo sbctl verify
    #This script sign automatically but provided only in cachyOS by default
    sudo sbctl-batch-sign
    sudo sbctl verify
    ```
    If everything done, reboot to firmware setting again and turn secure boot on then test it by booting into linux

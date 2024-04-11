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
  `paru -S brave-bin zen-browser-bin obsidian vesktop-bin`

- Code Editor or IDE
  `paru -S visual-studio-code-bin neovide vulkan-radeon zed intellij-idea-community-edition`

  > Intellij Idea can also be installed via jetbrains-toolbox

- Utilities
  `paru -S syncthing docker docker-rootless-extras docker-compose ncdu cloudflared distrobox `

- Flatpak Setup & Apps

  ```
  paru -S flatpak
  flatpak install flathub com.obsproject.Studio
  ```

- Virtual Machine Setup

  ```
  paru -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables edk2-ovmf
  ```

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
    ```
    paru -S inter-font ttf-jetbrains-mono-nerd nerd-fonts-inter ttf-ms-win10-auto --needed
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
    # This script sign automatically but provided only in cachyOS by default
    sudo sbctl-batch-sign
    sudo sbctl verify
    ```
    If everything done, reboot to firmware setting again and turn secure boot on then test it by booting into linux
  - Windows doesn't appear on systemd-boot list
    Install `paru -S edk2-shell` and move it to boot directory `sudo cp /usr/share/edk2-shell/x64/Shell.efi /boot/shellx64.efi`
    ```
    # Create new entries (usually in /boot/loader/entries/) windows.conf
    title   Windows
    efi     /shellx64.efi
    options -nointerrupt -nomap -noversion HD0b:EFI\Microsoft\Boot\Bootmgfw.efi
    ```
    Or another way, copy windows EFI folder to linux EFI folder
    ```
    sudo fdisk -l
    sudo mkdir /mnt/linuxefi
    sudo mkdir /mnt/windowsefi
    sudo mount /dev/<Windows-EFI-DEVICE-NAME> /mnt/windowsefi/
    sudo mount /dev/<Linux-EFI-DEVICE-NAME> /mnt/linuxefi/
    sudo cp -r /mnt/windowsefi/EFI/Microsoft /mnt/linuxefi/EFI/
    sudo umount /mnt/linuxefi/
    sudo umount /mnt/windowsefi/
    ```
  - Allow brightness below 5% to persist on reboot
    ```
    # Add this to /etc/udev/rules.d/99-backlight_clamp.rules
    # Allow <5% brightness to persist on reboot (disable clamped value of 5%)
    SUBSYSTEM=="backlight", ENV{ID_BACKLIGHT_CLAMP}="0"
    ```

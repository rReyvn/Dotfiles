# System Setup

## Login Configuration

- Fill in username automatically and only prompt password to login
  /etc/systemd/system/getty@tty1.service.d/skip-username.conf

  ```
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty -o '-p -- <USERNAME>' --noclear --skip-login - $TERM
  ```

- Or for autologin create file
  /etc/systemd/system/getty@tty1.service.d/autologin.conf
  > Make sure to provide password to login manager, otherwise password keyring will be messed up
  ```
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin <USERNAME> %I $TERM
  ```

## Environment Variable
> /etc/environment
```
# Adjust this based on apps installed
BROWSER=/usr/bin/brave
EDITOR=/usr/bin/nvim
TERMINAL=/usr/bin/kitty

# Only for docker rootless
DOCKER_HOST=unix:///run/user/1000/docker.sock
```

## Mounting Devices (HDD)
> /etc/fstab
```
UUID=BAB61B22B61ADEA7                       /mnt/HDD       ntfs-3g  x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133,nofail         0       0
UUID=522AF68F2AF66F7B                       /mnt/win/      ntfs-3g  x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133,nofail,noauto  0       0
```

## GNOME Keyring

> /etc/pam.d/login
> Paste at the end of each other section
```
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```

## Brightness persist below 5% after reboot 
> /etc/udev/rules.d/99-backlight_clamp.rules
```
SUBSYSTEM=="backlight", ENV{ID_BACKLIGHT_CLAMP}="0"
```

## Windows doesn't appear on boot menu list
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
## Secure Boot Setup
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


## Silent Boot
```
# Add this to kernel parameter
quiet loglevel=3 systemd.show_status=auto rd.udev.log_level=3
```

## Set default file manager to thunar
```
xdg-mime default thunar.desktop inode/directory
```

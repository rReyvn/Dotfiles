# Hyprland Setup

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

## Package & Dependencies List

```
paru -S hyprland hyprpaper hyprcursor hypridle hyprlock hyprpicker xdg-desktop-portal-hyprland hypr-zoom waybar wofi swaync swayosd-git \
grimblast-git gpu-screen-recorder-gtk libva-mesa-driver playerctl brightnessctl xorg-xev wev cliphist wlogout git ntfs-3g mpv yt-dlp \
nwg-look adw-gtk-theme nautilus imv file-roller gnome-keyring polkit-gnome gnome-tweaks gnome-disk papirus-icon-theme \
gnome-calculator zathura zathura-pdf-poppler xdg-desktop-portal-gtk sshfs network-manager-applet bluetui-bin firewalld systemctl-tui \
qt5-wayland qt6-wayland qt6ct qt5ct kvantum-qt5 kvantum kvantum-theme-libadwaita-git --needed
```

# Keyring Configuration

```
# /etc/pam.d/login
# Add this at the end of auth section
auth       optional     pam_gnome_keyring.so
# Add this at the end of session section
session    optional     pam_gnome_keyring.so auto_start
```

## Package List (Manual Install)

- Bibata-cursor (Both for xcursor or hyprcursor)

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
  ```
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin username %I $TERM
  ```

## Package & Dependencies List

```
yay -S hyprland hyprpaper hyprcursor hypridle hyprlock hyprpicker xdg-desktop-portal-hyprland waybar wofi dunst \
grimblast-git gpu-screen-recorder-gtk libva-mesa-driver playerctl brightnessctl xorg-xev wev cliphist wlogout git ntfs-3g mpv yt-dlp \
nwg-look adw-gtk-theme nautilus loupe file-roller gnome-keyring polkit-gnome gnome-tweaks papirus-icon-theme \
gnome-calculator evince xdg-desktop-portal-gtk sshfs network-manager-applet \
qt5-wayland qt6-wayland qt6ct qt5ct kvantum-qt5 kvantum kvantum-theme-libadwaita-git --needed
```

# Keyring Configuration

```
# Add this at the end of auth section
auth       optional     pam_gnome_keyring.so
# Add this at the end of session section
session    optional     pam_gnome_keyring.so auto_start
```

## Package List (Manual Install)

- Bibata-cursor (Both for xcursor or hyprcursor)

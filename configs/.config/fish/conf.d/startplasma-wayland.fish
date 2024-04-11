# Auto-start Plasma on TTY1 if no display server is running
if test (tty) = /dev/tty1
    # skip if a "no-gui" flag exists in home
    if not test -e "$HOME/.config/no-plasma"
        exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
    end
end

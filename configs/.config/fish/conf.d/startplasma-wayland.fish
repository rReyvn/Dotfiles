# Auto-start Plasma on TTY1 if no display server is running
if test (tty) = /dev/tty1
    exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
end

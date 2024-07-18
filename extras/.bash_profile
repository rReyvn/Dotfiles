#
# ~/.bash_profile
#
if [ -z "${WAYLAND_DISPLAY}" ] && [ "$XDG_VTNR" = 1 ]; then
  exec Hyprland >/dev/null
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

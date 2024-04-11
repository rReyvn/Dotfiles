function plasma-color-picker --description "Trigger color picker"
    if test "$XDG_CURRENT_DESKTOP" = KDE
        # Trigger qdbus for plasma color picker
        set COLOR (qdbus6 --literal org.kde.KWin /ColorPicker pick | grep -oE '[0-9]+')

        if test -n "$COLOR"
            # Convert picker result to full hex color format
            set HEX_COLOR (printf "%08x\n" "$COLOR")

            # Convert Hex to RGB
            set RGB_COLOR (string sub -s 3 $HEX_COLOR)

            # Copy to clipboard
            wl-copy "#$RGB_COLOR"
        end
    else
        echo "[!] This command only works on KDE Plasma"
    end
end

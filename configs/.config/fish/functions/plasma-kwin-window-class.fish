function plasma-kwin-window-class --description "Get window class on plasma"
    if test "$XDG_CURRENT_DESKTOP" = KDE
        # Use string collect so newline will be included, which is needed in this case
        set WIN_QUERY (qdbus6 org.kde.KWin /KWin queryWindowInfo | string collect)

        if not string match -qr '^Error:' -- "$WIN_QUERY"
            switch $argv[1]
                # Get all data from plasma window
                case all
                    wl-copy "$WIN_QUERY"
                case '*'
                    set WIN_CLASS (echo "$WIN_QUERY" | grep '^resourceClass:' | awk '{print $2}')
                    wl-copy "$WIN_CLASS"
            end
        end
    else
        echo "[!] This command only works on KDE Plasma"
    end
end

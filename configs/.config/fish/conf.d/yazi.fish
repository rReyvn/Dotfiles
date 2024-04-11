if type -q yazi
    function y --description 'Alias for yazi'
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
else
    echo (set_color red)"[x] "(set_color normal)"Yazi not found"
end

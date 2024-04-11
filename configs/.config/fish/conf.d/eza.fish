if type -q eza
    function ls
        eza -l --icons --group-directories-first --sort=size --hyperlink $argv
    end

    function la
        eza -Ga --icons --group-directories-first --hyperlink $argv
    end

    function ll
        eza -lah --icons --group-directories-first --hyperlink $argv
    end

    function lt
        eza -aT --sort=modified --git-ignore $argv
    end
else
    echo (set_color red)"[x] "(set_color normal)"eza not found"
end

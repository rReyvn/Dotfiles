for dir in ~/.local/bin ~/.bun/bin ~/.cargo/bin ~/.deno/bin/
    if test -d $dir; and not contains -- $dir $PATH
        set -p PATH $dir
    end
end

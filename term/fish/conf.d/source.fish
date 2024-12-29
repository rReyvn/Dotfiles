set asdf_src ~/.asdf/asdf.fish
set cargo_src ~/.cargo/env.fish
set golang_env ~/.asdf/plugins/golang/set-env.fish

if test -f $asdf_src
    source $asdf_src
end

if test -f $cargo_src
    source $cargo_src
end

if test -f $golang_env
    source $golang_env
end

zoxide init fish | source

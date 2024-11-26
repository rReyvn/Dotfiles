function sail --description 'Alias for Laravel Sail command'
    if test -f ./vendor/bin/sail
        ./vendor/bin/sail $argv
    else
        echo "Sail command not available in this directory."
    end
end

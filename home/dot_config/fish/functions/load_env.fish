#!/usr/bin/env fish

function load_env -a file scope -d "load .env file"
    set -l file (string trim $argv[1]) # Trim whitespace from the first argument
    if test -z "$file" # Check if the file variable is empty
        echo "load_env: Unknown command: \"$cmd\"" >&2 && return 1
    end

    if not test -e $file
        echo "load_env: file does not exist: \"$file\"" >&2 && return 1
    end
    while read -la line
        if not string match -q "#*" $line
            set -l key (string trim (string split -m1 "=" $line)[1])
            set -l value (string trim (string split -m1 "=" $line)[2..])
            if test -n "$key"
                set -xg $key (string join "=" $value | string trim)
            end
        end
    end <$file
end

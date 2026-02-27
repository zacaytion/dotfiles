function brew_dump --wraps='brew bundle dump --global --force --all --describe' --description 'alias brew_dump=brew bundle dump --global --force --all --describe'
    brew bundle dump --global --force --all --describe $argv
end

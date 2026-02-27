function brew_sync --wraps='brew bundle install --global --cleanup' --description 'alias brew_sync=brew bundle install --global --no-lock --cleanup'
    brew bundle install --global --cleanup $argv
end

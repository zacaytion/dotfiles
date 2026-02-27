#!/usr/bin/env fish

function brew_setup --wraps='brew alias sync=brew_sync' --description 'alias brew_setup=brew alias sync=brew_sync'
    brew alias sync=brew_sync
end

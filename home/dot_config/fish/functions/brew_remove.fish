#!/usr/bin/env fish

function brew_remove --wraps='brew uninstall && brew_dump' --description 'alias brew_remove=brew uninstall && brew_dump'
    brew uninstall $argv
    brew_bundle
end

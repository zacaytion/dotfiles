#!/usr/bin/env fish

function brew_add --wraps='brew install && brew dump' --description 'alias brew_add=brew install $argv && brew_dump'
    brew install $argv
    brew_dump
end

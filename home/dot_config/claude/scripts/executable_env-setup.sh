#!/usr/bin/env zsh

# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH
typeset -U PATH path

source "$HOME/.config/xdg.env"

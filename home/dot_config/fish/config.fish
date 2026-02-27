#!/usr/bin/env fish

if status is-login
    if not set -q __sourced_profile
        set -x __sourced_profile 1
        exec zsh -c "\
            test -e $HOME/.config/xdg.env && source $HOME/.config/xdg.env
            test -e $HOME/.config/local.env && source $HOME/.config/local.env
            exec /opt/homebrew/bin/fish --login
        "
    end

    # put your other configs below

    #

    set -e __sourced_profile
end

set -gx MISE_FISH_AUTO_ACTIVATE 1

###########################################
###### Spelling Config ####################
set -gx ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
set -gx ENCHANT_CONFIG_DIR $XDG_CONFIG_HOME/enchant
set -gx DICPATH $HOME/Library/Spelling/en_US-custom

fish_add_path -P -g /usr/local/{,s}bin /usr/{,s}bin /Library/Apple/usr/{,s}bin
fish_add_path -P -g /opt/homebrew/{,s}bin
fish_add_path -P -g $EMACSDIR/bin
fish_add_path -P -g $HOME/.local/bin $XDG_CONFIG_HOME/bin

###########################################
###### Ghostty Config #####################
if test -n "$GHOSTTY_RESOURCES_DIR"
    source "$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

###########################################
###### Claude Config ######################
set -gx CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS 1
set -gx CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR 1
set -gx CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1

###########################################
###### Abbreviations ######################
abbr -a -- ec 'emacsclient -nc'
abbr -a -- et 'emacsclient -t'

###########################################
###### User Scripts Config ################
fish_add_path -P -g $HOME/.local/bin $XDG_CONFIG_HOME/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

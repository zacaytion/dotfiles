/opt/homebrew/bin/brew shellenv | source

set -gx DOTFILES ~/.dotfiles

set -gx EDITOR emacs
set -gx VISUAL emacs
set -gx PAGER less

set -gx LANG 'en_US.UTF-8'
set -gx LC_ALL 'en_US.UTF-8'


# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
for cmd in lesspipe lesspipe.sh
    if type -q $cmd
        set LESSOPEN "| /usr/bin/env $cmd %s 2>&-"
        break
    end
end
 
###########################################
###### Homebrew Config ####################
set -gx XDG_CACHE_HOME ~/.cache
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_STATE_HOME ~/.local/state

###########################################
###### Homebrew Config ####################
set -gx HOMEBREW_CACHE $XDG_CACHE_HOME/Homebrew
set -gx HOMEBREW_LOGS $HOMEBREW_CACHE/Logs
set -gx HOMEBREW_CASK_OPTS "--require-sha"
set -gx HOMEBREW_DISPLAY_INSTALL_TIMES 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_FORCE_BREWED_CURL 1
set -gx HOMEBREW_FORCE_BREWED_GIT 1
set -gx HOMEBREW_FORCE_VENDOR_RUBY 1
set -gx HOMEBREW_NO_ENV_HINTS 1


###########################################
###### Emacs Config #######################
set -gx EMACSDIR ~/.emacs.d
set -gx DOOMDIR $XDG_CONFIG_HOME/doom.d

###########################################
###### Pager Config #######################
set -gx LESS '-g -i -M -R -S -w -X -z-4'
set -x -U LESSHISTFILE $XDG_STATE_HOME/lesshst

###########################################
###### AWS Config #########################
set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config

###########################################
###### MySQL Config #######################
set -gx MYSQL_HISTFILE $XDG_DATA_HOME/mysql_history

###########################################
###### Node Config ########################
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

###########################################
###### Postgres Config ####################
set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -gx PSQL_HISTORY $XDG_STATE_HOME/psql_history
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
# set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf

###########################################
###### Redis Config #####################
set -gx REDISCLI_HISTFILE $XDG_DATA_HOME/redis/rediscli_history
set -gx REDISCLI_RCFILE $XDG_CONFIG_HOME/redis/redisclirc

###########################################
###### Ripgrep Config #####################
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config

###########################################
###### Rust Config ########################
set -gx CARGO_HOME $XDG_DATA_HOME/cargo

###########################################
###### Starship Config ####################
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship.toml
set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship

###########################################
###### Terminfo Config ####################
set -gx TERMINFO $XDG_DATA_HOME/terminfo
set -gx TERMINFO_DIRS $XDG_DATA_HOME/terminfo /usr/share/terminfo

###########################################
###### TeX Config #########################
set -gx TEXMFHOME $XDG_DATA_HOME/texmf
set -gx TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
set -gx TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config

###########################################
###### Spelling Config ####################
set -gx ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
set -gx ENCHANT_CONFIG_DIR $XDG_CONFIG_HOME/enchant
set -gx DICPATH $HOME/Library/Spelling/en_US-custom

###########################################
###### Wget Config ########################
set -gx WGETRC $XDG_CONFIG_HOME/wgetrc

###########################################
###### Ghostty Config #####################
if test -n "$GHOSTTY_RESOURCES_DIR"
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

###########################################
###### Go Config ##########################
set -x -U GOPATH $XDG_DATA_HOME/go

###########################################
###### Abbreviations ######################

abbr -a ec emacsclient -nc
abbr -a et emacsclient -t

abbr -a g git
abbr -a gb git branch
abbr -a gc git commit --verbose
abbr -a gcm git commit --message
abbr -a gco git checkout

###########################################
###### Path Config ########################
fish_add_path -g /opt/{homebrew,local}/{,s}bin /usr/local/{,s}bin $HOME/.local/bin $EMACSDIR/bin


###########################################
###### Prompt Config ######################

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

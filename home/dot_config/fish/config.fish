#!/usr/bin/env fish

set -gx LANG 'en_US.UTF-8'
set -gx LC_ALL 'en_US.UTF-8'
set -gx EDITOR emacs -nw
set -gx VISUAL emacsclient -nw
set -gx PAGER less

set -gx DOTFILES $HOME/.dotfiles

fish_add_path -P -g /usr/local/{,s}bin /usr/{,s}bin /Library/Apple/usr/{,s}bin

###########################################
###### XDG Config ####################
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/Library/Caches
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_DATA_DIRS '$HOME/Library/Application Support' \
                        '/Library/Application Support' \
                        '/opt/homebrew/share' \
                        '/usr/local/share' \
                        '/usr/share'

set -gx XDG_CONFIG_DIRS  '~/Library/Application Support' \
                            '/Library/Application Support' \
                            '/etc/xdg'


###########################################
###### Homebrew Config ####################
set -gx HOMEBREW_CACHE $XDG_CACHE_HOME/Homebrew
set -gx HOMEBREW_LOGS $HOMEBREW_CACHE/Logs
set -gx HOMEBREW_CASK_OPTS --require-sha
set -gx HOMEBREW_DISPLAY_INSTALL_TIMES 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_FORCE_BREWED_CURL 1
set -gx HOMEBREW_FORCE_BREWED_GIT 1
set -gx HOMEBREW_FORCE_VENDOR_RUBY 1
set -gx HOMEBREW_NO_ENV_HINTS 1

fish_add_path -P -g /opt/homebrew/{,s}bin

###########################################
###### Less Config ########################
set -gx LESS '-g -i -M -R -S -w -X -z-4'
set -gx LESSHISTFILE $XDG_STATE_HOME/less_hst
set -gx LESSOPEN "|/opt/homebrew/bin/lesspipe.sh %s"

###########################################
###### Emacs Config #######################
set -gx EMACSDIR $HOME/.emacs.d
set -gx DOOMDIR $XDG_CONFIG_HOME/doom.d

fish_add_path -P -g $EMACSDIR/bin

###########################################
###### Mise Config ########################
set -gx MISE_CONFIG_DIR $XDG_CONFIG_HOME/mise
set -gx MISE_CACHE_DIR $XDG_CACHE_HOME/mise
set -gx MISE_STATE_DIR $XDG_STATE_HOME/mise
set -gx MISE_DATA_DIR $XDG_DATA_HOME/mise
set -gx MISE_FISH_AUTO_ACTIVATE 1
set -gx MISE_NODE_DEFAULT_PACKAGES_FILE $XDG_CONFIG_HOME/mise/default-packages/npm

###########################################
###### Node Config ########################
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_hst
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

###########################################
###### Rust Config ########################
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo

###########################################
###### Go Config ##########################
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOCACHE $XDG_CACHE_HOME/go
set -gx GOBIN $XDG_DATA_HOME/go/bin

###########################################
###### Postgres Config ####################
set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
set -gx PSPG_CONF $XDG_CONFIG_HOME/pg/pspg.conf
set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
set -gx PSQL_HISTORY $XDG_STATE_HOME/pg/psql_hst
set -gx PSPG_HISTORY $XDG_STATE_HOME/pg/pspq_hst

###########################################
###### AWS Config #########################
set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config

###########################################
###### MySQL Config #######################
set -gx MYSQL_HISTFILE $XDG_DATA_HOME/mysql_hst

###########################################
###### Redis Config #####################
set -gx REDISCLI_HISTFILE $XDG_DATA_HOME/redis/rediscli_hst
set -gx REDISCLI_RCFILE $XDG_CONFIG_HOME/redis/redisclirc

###########################################
###### Ripgrep Config #####################
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config

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
###### Podman Config #####################
fish_add_path -g -P /opt/podman/bin

###########################################
###### Little Snitch Config ###############
fish_add_path -g -P '/Applications/Little Snitch.app/Contents/MacOS'

###########################################
###### Claude Config ######################
set -gx CLAUDE_CONFIG_DIR $XDG_CONFIG_HOME/claude
set -gx CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS 1
set -gx CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR 1
# set -gx DISABLE_NON_ESSENTIAL_MODEL_CALLS 1
set -gx CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1

###########################################
###### Abbreviations ######################
abbr -a -- ec 'emacsclient -nc'
abbr -a -- et 'emacsclient -t'

###########################################
###### User Scripts Config ################
fish_add_path -P -g $HOME/.local/bin $XDG_CONFIG_HOME/bin
###########################################
###### Prompt Config ######################
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship.toml
set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

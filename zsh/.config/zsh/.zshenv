#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

###########################################
###### ASDF Config ########################
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

###########################################
###### AWS Config #########################
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config

###########################################
###### Bash Config ########################
export BASH_COMPLETION_USER_FILE=$XDG_CONFIG_HOME/bash-completion/bash_completion

###########################################
###### Docker Config ######################
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine

###########################################
###### MySQL Config #######################
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history

###########################################
###### Node Config ########################
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history

###########################################
###### Postgres Config ####################
export PSQLRC=$XDG_CONFIG_HOME/pg/psqlrc
export PSQL_HISTORY=$XDG_STATE_HOME/psql_history
export PGPASSFILE=$XDG_CONFIG_HOME/pg/pgpass
# export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

###########################################
###### Redis Config #####################
export REDISCLI_HISTFILE=$XDG_DATA_HOME/redis/rediscli_history
export REDISCLI_RCFILE=$XDG_CONFIG_HOME/redis/redisclirc

###########################################
###### Ripgrep Config #####################
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

###########################################
###### Rust Config ########################
export CARGO_HOME=$XDG_DATA_HOME/cargo

###########################################
###### Starship Config ####################
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship

###########################################
###### Terminfo Config ####################
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$XDG_DATA_HOME/terminfo:/usr/share/terminfo

###########################################
###### TeX Config #########################
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

###########################################
###### Tmux Config ########################
export TMUXINATOR_CONFIG=$XDG_CONFIG_HOME/tmuxinator

###########################################
###### Spelling Config ####################
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
export ENCHANT_CONFIG_DIR=$XDG_CONFIG_HOME/enchant
export DICPATH=$HOME/Library/Spelling/en_US-custom

###########################################
###### Wget Config ########################
export WGETRC=$XDG_CONFIG_HOME/wgetrc


# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

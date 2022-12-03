###########################################
###### Dotfiles Home ######################
export DOTFILES=$HOME/dotfiles

###########################################
###### XDG Base Directory Config ##########
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# export XDG_RUNTIME_DIR="${HOME}/Library/Application\ Support"
# export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share}"
# export XDG_CONFIG_DIRS="~/Library/Preferences:/Library/Application/ Support:/Library/Preferences"

###########################################
###### Homebrew Config ####################
export HOMEBREW_CACHE=$XDG_CACHE_HOME/Homebrew
export HOMEBREW_LOGS=$HOMEBREW_CACHE/Logs
export HOMEBREW_CASK_OPTS="--require-sha"
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_FORCE_VENDOR_RUBY=1


###########################################
###### Emacs Config #######################
export EMACSDIR=$HOME/.emacs.d
export DOOMDIR=$XDG_CONFIG_HOME/doom.d


###########################################
###### ZSH Config #########################
export HISTFILE=$XDG_STATE_HOME/zsh/history # create this file
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

source $ZDOTDIR/.zshenv

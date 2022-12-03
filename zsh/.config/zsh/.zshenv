#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export DOTFILES=$HOME/dotfiles
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export DOOMDIR=$XDG_CONFIG_HOME/doom.d
export EMACSDIR=$HOME/.emacs.d
export ENCHANT_CONFIG_DIR=$XDG_CONFIG_HOME/enchant
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
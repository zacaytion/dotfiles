#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/zprezto/init.zsh"
fi


alias dtop='lazydocker'
alias ec='emacsclient -nc'
alias et='emacsclient -t'


source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

eval "$(starship init zsh)"

source "$DOTFILES/zsh/zprezto/init.zsh"

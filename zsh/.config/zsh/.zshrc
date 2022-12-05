#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
if [[ -s "${ZDOTDIR:-$HOME}/zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/zprezto/init.zsh"
fi


alias dtop='lazydocker'
alias ec='emacsclient -nc'
alias et='emacsclient -t'

## ASDF Setup
source $(brew --prefix asdf)/libexec/asdf.sh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

eval "$(starship init zsh)"

# Source Prezto.
source "$DOTFILES/zsh/zprezto/init.zsh"

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Spaceship Theme
SPACESHIP_CHAR_PREFIX=''
# Fix stupid [I] 
export SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section 
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version 
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  # xcode         # Xcode section 
  # swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section 
  docker        # Docker section 
  aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda       # conda virtualenv section
  # pyenv       # Pyenv section
  # dotnet      # .NET section
  # ember       # Ember.js section 
  # kubecontext # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  # battery     # Battery level and status
  # vi_mode     # Vi-mode indicator 
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/zah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/zah/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=~/Library/Python/3.7/bin:$PATH

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/zah/.nvm/versions/node/v9.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/zah/.nvm/versions/node/v9.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/zah/Projects/bigspring/packages/functions/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/zah/Projects/bigspring/packages/functions/node_modules/tabtab/.completions/sls.zsh
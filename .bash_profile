# Homebrew path
export PATH=/usr/local/bin:$PATH

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Node Version Management
source /usr/local/opt/nvm/nvm.sh
export NVM_DIR=/Users/david/.nvm


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Git autocomplete and prompt
source /usr/local/Cellar/git/2.1.2/etc/bash_completion.d/git-completion.bash
source /usr/local/Cellar/git/2.1.2/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1

# Set prompt to include git branch
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

#PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '
PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'

# Default Prompt
#PS1='\h:\W \u\$'

alias fm-dev='foreman start -f Procfile.dev'

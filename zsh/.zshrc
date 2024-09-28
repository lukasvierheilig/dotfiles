
# ~~~~~~~~~~~~~~~ Environment Valirables ~~~~~~~~~~~~~~~

# Directories

GITHUBUSER=lukasvierheilig
GITLABUSER=lukas4h

export REPOS="$HOME/code/repos"
export GITHUBREPOS="$REPOS/github.com/$GITHUBUSER"
export DOTFILES="$GITHUBREPOS/dotfiles"
export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  poetry
)



ZSH_THEME="robbyrussell"

export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

export TERM="tmux-256color"

export BROWSER="brave"

DEFAULT_USER=LukasVierheilig

export XDG_CONFIG_HOME=$HOME/.config

# Fuzzy Finder
# fzf docs: https://github.com/junegunn/fzf

export FZF_DEFAULT_COMMAND='fd --type f --hidden --color=never --follow --exclude .git --strip-cwd-prefix'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'
export FZF_CTRL_T_COMMAND="fd --type d . --color=never --hidden"
export FZF_CTRL_T_OPTS="--preview 'tree -C {} | head -50'"

# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~

setopt extended_glob null_glob

PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/local/sbin  # Homebrew's "sbin"

export PATH

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias ..="cd ../";
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias cat="bat"

# git aliases
function gc { git commit -m "$@"; }
alias gcm="git checkout main";
alias gs="git status";
alias gp="git pull";
alias gd="git diff";
alias ga="git add -i";
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %C(blue)%an%Creset' --abbrev-commit --branches"
alias glogp="git log --graph --pretty=format:'%h -%d %s (%cr) %an' --abbrev-commit --branches"
alias glast="git log -1 HEAD"

# Python
alias python='python3'

# other aliases
alias zshrc='nvim ~/.zshrc'
alias myip="curl http://ipecho.net/plain; echo"
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias sshconf="nvim ~/.ssh/config"
alias runp="lsof -i "
alias vim='nvim'

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~

source <(fzf --zsh)             # Set up fzf key bindings and fuzzy completion
#source <(ng completion script)  # Load Angular CLI autocompletion.
source $ZSH/oh-my-zsh.sh

# ~~~~~~~~~~~~~~~ Navigaion ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(zoxide init zsh)"

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

# SDK-Man config
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Node Version Manager config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ~~~~~~~~~~~~~~~ Environment Valirables ~~~~~~~~~~~~~~~

GITHUBUSER=lukasvierheilig
GITLABUSER=lukas4h

export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

export TERM="tmux-256color"

export BROWSER="brave"

JAVA_VERSION=20
export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)

DEFAULT_USER=LukasVierheilig

export XDG_CONFIG_HOME=$HOME/.config

export FZF_DEFAULT_COMMAND='fd --type f --hidden --color=never --follow --exclude .git'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'


# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :50 {}' --preview-window=right:60%:wrap --extended"

export FZF_CTRL_T_COMMAND="fd --type d . --color=never --hidden"
export FZF_CTRL_T_OPTS="--preview 'tree -C {} | head -50'"


# TMUX color voodo -> https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
# export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# Directories

export REPOS="$HOME/code/repos"
export GITHUBREPOS="$REPOS/github.com/$GITHUBUSER"
export DOTFILES="$GITHUBREPOS/dotfiles"


# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~


setopt extended_glob null_glob


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~


alias c="code .";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias de="cd ~/Desktop";
alias dd="cd ~/code";
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
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
alias sshconf="vim ~/.ssh/config"
alias runp="lsof -i "
alias vim="nvim"


# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~


source <(fzf --zsh)             # Set up fzf key bindings and fuzzy completion
source <(ng completion script)  # Load Angular CLI autocompletion.


# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~


fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select

#Example to install completion:
# talosctl completion zsh > ~/.zfunc/_talosctl


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"


## ENV setup
export ZSH="/Users/LukasVierheilig/.oh-my-zsh"
export EDITOR="/usr/local/bin/nvim"

JAVA_VERSION=20
export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

DEFAULT_USER=LukasVierheilig

export XDG_CONFIG_HOME=$HOME/.config

#ZSH_THEME_FAVORITES="crcandy robbyrussell"
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $ZSH/oh-my-zsh.sh
source /Users/LukasVierheilig/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# custom aliases
alias gccUni="gcc -std=c99 -pedantic -Wall -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_POSIX_C_SOURCE=200809L -g -c ";
alias c="code .";
alias ll="exa -al --git --icons";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias de="cd ~/Desktop";
alias dd="cd ~/code";
alias d="cd ~/code && cd "
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u";
alias cat="bat"

# git aliases
function gc { git commit -m "$@"; }
alias gcm="git checkout main";
alias gs="git status";
alias gpull="git pull";
alias gf="git fetch";
alias gfa="git fetch --all";
alias gf="git fetch origin";
alias gpush="git push";
alias gd="git diff";
alias ga="git add -i";
alias gb="git branch";
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog";
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git gpush --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %C(blue)%an%Creset' --abbrev-commit --branches"
alias glogp="git log --graph --pretty=format:'%h -%d %s (%cr) %an' --abbrev-commit --branches"
alias glast="git log -1 HEAD"

## checkout a new remote branch (exists remote, not locally)
## git checkout -b LocalName origin/remotebranchname (checkout a remote branch)

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && echo NPM is done";

## yarn aliases
alias yar="yarn run"; # lists all the scripts we have available
alias yab="yarn build"; # build dist directory for each package
alias yal="yarn lint:fix"; # format source and auto-fix eslint issues
alias yac="yarn commit"; # open a Q&A prompt to help construct valid commit messages
alias yas="yarn start";
alias yasb="yarn storybook:start"; # start storybook
alias yat="yarn test"; # run the unit tests*
alias yatw="yarn test:watch"; #run the unit tests for files changed on save

## docker
alias dockerstop='docker-compose stop'
alias dockerrestart='docker-compose restart'
alias dockerup='docker-compose up -d'
alias dockerrm='docker-compose rm --all'

## Python
alias python='python3'

## other aliases
alias zshrc='nvim ~/.zshrc'
alias myip="curl http://ipecho.net/plain; echo"
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias sshconf="vim ~/.ssh/config"
alias runp="lsof -i "
alias md="mkdir "
alias ..='cd ..'
alias ...='cd ../..'
alias vim="nvim"


## FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --color=never --follow --exclude .git'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'


# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :50 {}' --preview-window=right:60%:wrap --extended"

export FZF_CTRL_T_COMMAND="fd --type d . --color=never --hidden"
export FZF_CTRL_T_OPTS="--preview 'tree -C {} | head -50'"

# TMUX 
#export TERM=xterm-256color

# TMUX color voodo -> https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

#PATH variables

#psql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/12/bin

#mysql
export PATH=${PATH}:/usr/local/mysql/bin

#yarn
export PATH="$PATH:/opt/yarn-[version]/bin"

#node
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

#pip
export PATH="/Users/LukasVierheilig/Library/Python/3.8/bin:$PATH"

#conda
export PATH="/usr/local/anaconda3/bin:$PATH"

#jupiter-lab env stuff
export PATH="/Users/LukasVierheilig/Library/Python/3.8/bin:$PATH"

#lunarvim
export PATH="/Users/LukasVierheilig/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# intelliJ complaining about not having correct docker path ...
export PATH=$PATH:"/usr/local/bin"

#emacs

export PATH="$HOME/.config/emacs/bin:$PATH"

# starship

# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"

  # on mac os use the systemprofiler to determine the current model
  _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')

  case $_device in
    *MacBook*)     DEVICE="";;
    *mini*)        DEVICE="󰇄";;
    *)             DEVICE="";;
  esac
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"
export STARSHIP_DEVICE="$DEVICE"

# starship END


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/LukasVierheilig/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/LukasVierheilig/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/LukasVierheilig/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/LukasVierheilig/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Load Angular CLI autocompletion.
source <(ng completion script)

# eval "$(starship init zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

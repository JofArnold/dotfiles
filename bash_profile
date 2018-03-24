#!/bin/bash
export IGNOREEOF=5
export PATH=$PATH:/usr/local/Cellar/mysql/5.6.10/bin/mysql
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:usr/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=$PATH:$HOME/Library/Python/2.7/bin/
#export PATH="/node_modules/.bin"
#export PATH="/usr/local/share/npm/lib/node_modules/coffee-script/bin/:$PATH"
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias go='git checkout '
alias gr='git reset '
alias gt='git tag '
alias gr='git rebase '
alias gri='git rebase -i '
alias gk='gitk --all&'
alias gx='gitx --all'
alias ghurl='git ghurl'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gpupr='git push -u origin $(git rev-parse --abbrev-ref HEAD) && open $(ghurl)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1'
alias gpr='git pull --rebase'
alias gmt='git mergetool '
alias gcp='git commit -p'

# database stuff
alias nr='npm_config_loglevel=silent npm run'
alias migrate='nr db:migrate:dev'
alias rollback='nr db:rollback:dev'

# rebuild OpenWith
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# selenium shortcuts
alias 'selenium-server-standalone'='java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.33.0.jar -p 4444'

alias e='nvim'

# config terminal
set -o vi
#export TERM='xterm-256color'
export TERM='screen-256color'
#export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:usr/bin:$PATH"

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  # This one includes the directory. Ditched that due to having dir in tabs now
  PS1="💥  \e[0;31m\W $\e[m "
  #PS1="\e[0;31m$\e[m "
else # normal
  #PS1="\e[0;32m\$ \e[m"
  #PS1="\e[0;31m\$ \e[m"
  #PS1="\e[0;31m\$ \e[m"
  #PS1="\e[0;31m \$ \e[m"
  # PS1="$(basename $(dirname $PWD))/$(basename $PWD)"
  PS1=" \[$txtblu\]\w\e[0m \[$txtred\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\n \[$txtgrn\]$\[$txtrst\] "
  # PS1=" \[$txtblu\]\e[4m\w\e[0m \e[2m\[$txtred\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\n \[$txtgrn\]$\[$txtrst\] "
  #PS1="\e[0;31m\W\e[m \[$txtcyn\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "
fi

#PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Nice ls colors
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Sane open file limits
ulimit -n 2560

##
# Your previous /Users/cody/.bash_profile file was backed up as /Users/cody/.bash_profile.macports-saved_2015-04-12_at_18:37:47
##

# MacPorts Installer addition on 2015-04-12_at_18:37:47: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# mkdir, cd into it
mkcd () {
mkdir -p "$*"
cd "$*"
}

alias esinit='yarn add eslint babel-eslint eslint-cli eslint-config-prettier eslint-plugin-prettier eslint-plugin-react prettier --dev && curl https://raw.githubusercontent.com/JofArnold/dotfiles/master/eslintrc.js -o .eslintrc.js && eslint_d stop && eslint_d start'

export PATH="$HOME/.cargo/bin:$PATH"

source ~/.bin/tmuxinator.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

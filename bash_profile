#!/bin/bash
export PATH=$PATH:/usr/local/Cellar/mysql/5.6.10/bin/mysql
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:usr/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
#export PATH="/node_modules/.bin"

# git
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias go="git checkout "
alias gk="gitk --all&"
alias gx="gitx --all"
alias glog="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gh="git hist"
alias gp="git pull --rebase"
alias gca="git commit -a"
alias got="git "
alias get="git "

# dev shortcuts
alias c4l="cd ~/Dev/Clients/c4l-smart-restart/"

# rebuild OpenWith
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# selenium shortcuts
alias 'selenium-server-standalone'='java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.33.0.jar -p 4444'

# config terminal
set -o vi
export TERM='xterm-256color'
#export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:usr/bin:$PATH"

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  # This one includes the directory. Ditched that due to having dir in tabs now
  PS1="\e[0;31m\W $\e[m "
  #PS1="\e[0;31m$\e[m "
else # normal
  #PS1="\e[0;32m\$ \e[m"
  #PS1="\e[0;31m\$ \e[m"
  #PS1="\e[0;31m\$ \e[m"
  #PS1="\e[0;31m \$ \e[m"
  PS1="\[$txtred\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "
  #PS1="\e[0;31m\W\e[m \[$txtcyn\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "
fi

#PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Nice ls colors
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad


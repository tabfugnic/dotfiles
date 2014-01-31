export TERM="xterm-color"
export PS1="\[\e[1;30m\][\[\e[1;30m\]\[\e[1;31m\] \`gcb\` \[\e[1;32m\]\w\[\e[0m\]\[\e[1;30m\] ]\n[ \[\e[0;33m\]\T\[\e[1;30m\] ] > \[\e[1;37m\]"
export EDITOR=emacs
# export GIT_EDITOR='emacsclient -t'
export rvmsudo_secure_path=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/opt/android/tools # Android to this business
PATH=$PATH:$HOME/opt/android/platform-tools # Android to this business
PATH="$PATH:$HOME/.cask/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. "$HOME/.bash_aliases"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

set_term_title(){
   echo -en "\033]0;$1\a"
}

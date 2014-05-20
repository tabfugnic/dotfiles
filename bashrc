export TERM="xterm-color"
export PS1="\[\e[1;30m\][\[\e[1;30m\]\[\e[1;31m\] \`gcb\` \[\e[1;32m\]\w\[\e[0m\]\[\e[1;30m\] ]\n[ \[\e[0;33m\]\T\[\e[1;30m\] ] > \[\e[1;37m\]"
export EDITOR='emacsclient -c'
export GIT_EDITOR='emacsclient -c'
export rvmsudo_secure_path=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH="$PATH:$HOME/.cask/bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/elixir/bin"
MONO_PATH="/usr/lib/keepass2${MONO_PATH:+:$MONO_PATH}"
export MONO_PATH

[[ -z $DISPLAY ]] && exec startx
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

. "$HOME/.bash_aliases"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

set_term_title(){
   echo -en "\033]0;$1\a"
}

. "$HOME/git-completion.bash"

. /usr/local/share/chruby/chruby.sh

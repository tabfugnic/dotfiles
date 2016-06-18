#! /bin/bash

# Terminal Interface
. bash/terminal.sh

#  Editor
. bash/editor.sh

export KEY_ID=771AB877

. /usr/local/share/chruby/chruby.sh
. /usr/local/share/chruby/auto.sh
chruby 2.2.3

export GOPATH="$HOME/golang"
export ARDUINO_DIR="/usr/share/arduino"
export ARDMK_DIR="/usr"
export AVR_TOOLS_DIR="/usr"
export ANDROID_HOME="$HOME/opt/android"
PATH="$PATH:$HOME/.cask/bin"
PATH="$PATH:$HOME/bin"
PATH=$PATH:$HOME/opt/android/tools
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:$HOME/parity/bin"

[[ -z $DISPLAY ]] && exec startx
. /usr/share/bash-completion/completions/pass

. "$HOME/.aliases"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

set_term_title() {
   echo -en "\033]0;$1\a"
}

mkcd() {
  mkdir $1 && cd $1
}

. "$HOME/git-completion.bash"

export NVM_DIR="/home/eric/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

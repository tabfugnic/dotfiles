#! /usr/bin/env sh

TERMINAL=kitty
TERM=kitty

export TERMINAL
export TERM

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

. "$HOME/.env"
. "$HOME/.cargo/env"

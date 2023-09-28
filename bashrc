#! /bin/bash

# Run sources
for file in ~/.bash/*; do source $file; done

# Get aliases
source "$HOME/.aliases"

# Take in machine local config
[ -s "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

[ -s "$HOME/.env" ] && source "$HOME/.env"
. "$HOME/.cargo/env"

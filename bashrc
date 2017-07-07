#! /bin/bash

# Run sources
for file in ~/.bash/*; do source $file; done

# Get aliases
source "$HOME/.aliases"

# Take in machine local config
source "$HOME/.bashrc.local"

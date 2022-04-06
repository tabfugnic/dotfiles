. /etc/bash_completion.d/git-prompt

export TERMINAL="kitty"
export TERM="kitty"

red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
white="\[\e[0;37m\]"

current_branch='$(__git_ps1 "%s ")'

hostname="$yellow\h"
git_branch="$red$current_branch"
current_directory="$green\W"

PS1="";

if [ "$SSH_CONNECTION" ]; then
  PS1="$PS1 $hostname"
fi

export PS1="$PS1 $git_branch$current_directory $white> "

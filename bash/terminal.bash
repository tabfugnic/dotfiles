export TERM="xterm-256color"
black="\[\e[0m\]"
gray="\[\e[1;30m\]"
light_red="\[\e[1;31m\]"
light_green="\[\e[1;32m\]"
white="\[\e[1;37m\]"

export PS1="$gray[$light_red \`gcb\` $light_green\W$black$gray ] > $white"

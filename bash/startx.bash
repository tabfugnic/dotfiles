# Start i3
command -v startx &> /dev/null &&
  [[ -z $DISPLAY ]] &&
  [[ $(tty) = /dev/tty1 ]] &&
  exec startx

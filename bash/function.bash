# Create directory and enter
mkcd() {
  mkdir $1 && cd $1
}

# set terminal title
set_term_title() {
   echo -en "\033]0;$1\a"
}

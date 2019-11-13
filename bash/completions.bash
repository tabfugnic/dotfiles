check_and_source() {
  local file=$1

  [ -f "$file" ] && source "$file"
}
check_and_source /usr/share/bash-completion/completions/git
check_and_source /usr/share/bash-completion/completions/pass

unset -f check_and_source

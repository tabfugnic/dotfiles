check_and_source() {
  local file=$1

  [ -f "$file" ] && source "$file"
}
check_and_source /usr/share/bash-completion/completions/git
check_and_source /usr/share/bash-completion/completions/pass
check_and_source /usr/share/bash-completion/completions/pass-otp

unset -f check_and_source

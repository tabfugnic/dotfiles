chruby_directory="/usr/local/share/chruby"

if [ -d "$chruby_directory" ]; then
   . $chruby_directory/chruby.sh
   . $chruby_directory/auto.sh
fi

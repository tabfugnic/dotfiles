echo "Prepare dotfiles"
rm -rf $HOME/.emacs.d
rm -rf $HOME/.i3

mkdir $HOME/bin &> /dev/null || true
mkdir $HOME/.offlineimap >& /dev/null || true

echo "Link up dotfiles"
ln -fs `pwd`/bashrc $HOME/.bashrc
ln -fs `pwd`/bash_aliases $HOME/.bash_aliases
ln -fs `pwd`/bash_profile $HOME/.bash_profile
ln -fs `pwd`/emacs $HOME/.emacs
ln -fs `pwd`/emacs.d/ $HOME/.emacs.d
ln -fs `pwd`/i3/ $HOME/.i3
ln -fs `pwd`/i3status.conf $HOME/.i3status.conf
ln -fs `pwd`/offlineimaprc $HOME/.offlineimaprc
ln -fs `pwd`/offlineimap/config.py $HOME/.offlineimap/config.py
ln -fs `pwd`/bin/stop_rsi $HOME/bin/stop_rsi
ln -fs `pwd`/bin/i3exit $HOME/bin/i3exit
ln -fs `pwd`/bin/setup_terminals $HOME/bin/setup_terminals

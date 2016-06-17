echo "Remove the old stuff"
rm -rf $HOME/.bashrc $HOME/.bash_aliases $HOME/.bash_profile $HOME/.emacs $HOME/.emacs.d $HOME/.i3* $HOME/.offlineimaprc $HOME/.wl

mkdir $HOME/bin &> /dev/null || true
mkdir $HOME/.offlineimap >&1 /dev/null || true

echo "Link up dotfiles"
ln -s `pwd`/bashrc $HOME/.bashrc
ln -s `pwd`/bash_aliases $HOME/.bash_aliases
ln -s `pwd`/bash_profile $HOME/.bash_profile
ln -s `pwd`/emacs $HOME/.emacs
ln -s `pwd`/emacs.d/ $HOME/.emacs.d
ln -s `pwd`/i3/ $HOME/.i3
ln -s `pwd`/i3status.conf $HOME/.i3status.conf
ln -s `pwd`/offlineimaprc $HOME/.offlineimaprc
ln -s `pwd`/offlineimap_config.py $HOME/.offlineimap/config.py
ln -s `pwd`/bin/stop_rsi $HOME/bin/stop_rsi
ln -s `pwd`/bin/i3exit $HOME/bin/i3exit

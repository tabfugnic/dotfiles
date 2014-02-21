echo "Remove the old stuff"
rm -rf $HOME/.bashrc $HOME/.bash_aliases $HOME/.bash_profile $HOME/.emacs $HOME/.emacs.d $HOME/.i3*

echo "Link up dotfiles"
ln -s `pwd`/bashrc $HOME/.bashrc
ln -s `pwd`/bash_aliases $HOME/.bash_aliases
ln -s `pwd`/bash_profile $HOME/.bash_profile
ln -s `pwd`/emacs $HOME/.emacs
ln -s `pwd`/emacs.d/ $HOME/.emacs.d
ln -s `pwd`/i3/ $HOME/.i3
ln -s `pwd`/i3status.conf $HOME/.i3status.conf

echo "All done!"

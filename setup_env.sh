echo "Remove the old stuff"
rm $HOME/.bashrc $HOME/.bash_aliases $HOME/.bash_profile $HOME/.emacs $HOME/.emacs.d

echo "Link up dotfiles"
ln -s `pwd`/bashrc $HOME/.bashrc
ln -s `pwd`/bash_aliases $HOME/.bash_aliases
ln -s `pwd`/bash_profile $HOME/.bash_profile
ln -s `pwd`/emacs $HOME/.emacs
ln -s `pwd`/emacs.d/ $HOME/.emacs.d

echo "All done!"

# dotfiles
To install: go to home directory and type:
git clone --recursive git@github.com:yakirr/dotfiles.git
(the --recursive is so that submodules containing plugins are copied over as well)
then type:
mv dotfiles .vim
ln -s ~/.vim/vimrc .vimrc

(it may be that pathogen needs to be installed first. not sure.)

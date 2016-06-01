# dotfiles
To install:

1. Install vim pathogen (see https://github.com/tpope/vim-pathogen).

2. Go to home directory and type
```
git clone --recursive git@github.com:yakirr/dotfiles.git
```
the --recursive is so that submodules containing plugins are copied over as well.

3. Type
```
mv dotfiles/* .vim/
mv dotfiles/.git .vim/
mv dotfiles/.gitmodules .vim/
rm -rf dotfiles
ln -s ~/.vim/vimrc .vimrc
```

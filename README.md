# dotfiles
To install:

1. Make sure you have an ssh key set up to work with github (see https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux)

2. Install vim pathogen (see https://github.com/tpope/vim-pathogen).

3. Go to home directory and type
```
git clone --recursive git@github.com:yakirr/dotfiles.git
```
the --recursive is so that submodules containing plugins are copied over as well.

4. Type
```
mv dotfiles/* .vim/
mv dotfiles/.git .vim/
mv dotfiles/.gitmodules .vim/
mv dotfiles/.gitignore .vim/
rm -rf dotfiles
ln -s ~/.vim/vimrc .vimrc
```

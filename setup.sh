
# remove existing .vimrc
rm ~/.vimrc
# make a soft link to this file
ln -s ~/vim/vimrc ~/.vimrc
# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#download plugins
vim +PluginInstall
mkdir ~/.vim/swap/
mkdir ~/.vim/undo/
mkdir ~/.vim/backup/

sudo apt install vim-gtk
sudo apt install exuberant-ctags
sudo apt install universal-ctags
sudo apt install git-flow
sudo apt install powerline
sudo apt install gnupg2
sudo apt install trash-cli

#install nerdfont
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/AnonymousPro.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/OpenDyslexic.zip
unzip AnonymousPro.zip -d ~/.fonts
unzip Noto.zip -d ~/.fonts
unzip OpenDyslexic.zip -d ~/.fonts
fc-cache -fv

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

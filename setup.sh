sudo apt install vim-gtk
#sudo apt install exuberant-ctags
sudo apt install universal-ctags
sudo apt install git-flow
sudo apt install powerline
sudo apt install gnupg2
#needed for fern to delete to trash
sudo apt install trash-cli
#very fast searching for FZF to use
sudo apt install ripgrep
#needed for FZF to do syntax highlighting in preview
sudo apt install bat


#set FZF to use ripgrep
#-m allows selectioon of multiple files
sed -i '2iexport FZF_DEFAULT_COMMAND="rg --files"' ~/.bashrc
sed -i '2iexport FZF_DEFAULT_OPTS="-m --height 50% --border"' ~/.bashrc
#install nerdfont
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip
unzip Noto.zip -d ~/.fonts
fc-cache -fv

# remove existing .vimrc
rm ~/.vimrc
# make a soft link to this file
ln -s ~/vim/vimrc ~/.vimrc
mkdir ~/.vim/swap/
mkdir ~/.vim/undo/
mkdir ~/.vim/backup/
mkdir ~/.vim/after/
mkdir ~/.vim/after/plugin/

ln -s ~/vim/after.vim ~/.vim/after/plugin/after.vim
# install vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#download plugins
#vim +PluginInstall

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#download plugins
vim +PlugInstall


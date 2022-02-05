sudo apt update
sudo apt upgrade
sudo apt install neovim
sudo apt install universal-ctags
sudo apt install git-flow
sudo apt install powerline
sudo apt install gnupg2

# needed for fern to delete to trash
sudo apt install trash-cli

# very fast searching for FZF to use
sudo apt install ripgrep

# needed for FZF to do syntax highlighting in preview
sudo apt install bat

# for emoji support
sudo pip install emoji-fzf

# LSP support for vim files
sudo npm install -g vim-language-server

# set FZF to use ripgrep
# -m allows selectioon of multiple files
grep -q 'export FZF_DEFAULT_COMMAND="rg --files"' ~/.bashrc \
	|| sed -i '2iexport FZF_DEFAULT_COMMAND="rg --files"' ~/.bashrc
grep -q 'export FZF_DEFAULT_OPTS="-m --height 50% --border"' ~/.bashrc \
	||  sed -i '2iexport FZF_DEFAULT_OPTS="-m --height 50% --border"' ~/.bashrc

echo "would you like to install fonts?"
echo "type y for yes"
echo ""
read reply
case $reply in

y)
# install nerdfont
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Noto.zip
unzip Noto.zip -d ~/.fonts
fc-cache -fv
;;

esac

# move existing .vimrc
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup 
# make a soft link to this file
mkdir ~/.config/nvim/
ln -s ~/vim/vimrc ~/.config/nvim/init.vim
#mkdir ~/.vim/swap/
#mkdir ~/.vim/undo/
#mkdir ~/.vim/backup/
mkdir ~/.config/nvim/after/
mkdir ~/.config/nvim/after/plugin/
ln -s ~/vim/after.vim ~/.config/nvim/after/plugin/after.vim

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# open vim and run initial setup function
nvim -c"call Setup()"

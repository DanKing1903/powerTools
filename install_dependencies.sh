# install zsh and oh my zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install missing libraries for compiling modern python 3 versions
sudo apt-get install lzma
sudo apt-get install liblzma-dev
sudo apt-get install libbz2-dev

# install stow and stow folders
sudo apt install stow
stow -t ~ vim
stow -t ~/.config ranger

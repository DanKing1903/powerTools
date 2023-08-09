# checkout submodules
git submodule update --init --recursive

# install missing libraries for compiling modern python 3 versions
sudo apt-get install lzma
sudo apt-get install liblzma-dev
sudo apt-get install libbz2-dev

# install ranger
sudo apt install ranger

# install stow and stow folders
sudo apt install stow
stow -t ~ vim
mkdir -p ~/.config
stow -t ~/.config ranger
stow -t ~ pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
stow -t ~/.pyenv/plugins/ pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
__zsh_extras='export EDITOR=vim
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
git config --global credential.helper "cache --timeout=3600"
'
echo "$__zsh_extras" >> ~/.zshrc


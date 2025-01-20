## checkout submodules
git submodule update --init --recursive
#
## install missing libraries for compiling modern python 3 versions
#sudo apt-get install lzma
#sudo apt-get install liblzma-dev
#sudo apt-get install libbz2-dev
#
## install ranger
#sudo apt install ranger
#
## install stow and stow folders
#sudo apt install stow
curl https://pyenv.run | bash

if [ -f "$HOME/.zimrc" ]; then
    echo "The file ~/.zimrc exists."
else
    echo "The file ~/.zimrc does not exist."
fi

# List of brew formulas to check/install
PYTHON_BUILD_FORMULAS=("openssl" "readline" "sqlite3" "xz" "zlib" "tcl-tk@8")
PIPX_INSTALLED=false

echo "Checking for missing python build dependencies..."

# Iterate over each formula
for formula in "${PYTHON_BUILD_FORMULAS[@]}"; do
    if brew list "$formula" &>/dev/null; then
        echo "$formula is already installed."
    else
        echo "$formula is not installed. Installing..."
        brew install "$formula"
    fi
done

echo "Checking for pipx..."

# Check and install pipx
if brew list pipx &>/dev/null; then
    echo "pipx is already installed."
    PIPX_INSTALLED=true
else
    echo "pipx is not installed. Installing..."
    brew install pipx
    pipx ensurepath
    PIPX_INSTALLED=true
fi
echo "All python build ddependencies are installed."


stow -t ~ vim
mkdir -p ~/.config
stow -t ~/.config ranger

echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
__zsh_extras='export EDITOR=vim
git config --global credential.helper "cache --timeout=3600"
'
echo "$__zsh_extras" >> ~/.zshrc


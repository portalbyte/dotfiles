#!/bin/bash

#
### Dotfiles Installer
#


### DEVICE SELECTOR

echo "Please select the device:"
echo "1) GLaDOS"
echo "2) Wheatley"
echo "3) Caroline (TODO)"

# get device
read device


### INSTALL DOTFILES

# neovim
mkdir -p $HOME/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln "./Shared/Neovim/init.vim" "$HOME/.config/nvim/init.vim"
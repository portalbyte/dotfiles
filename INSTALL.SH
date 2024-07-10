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

if [ $device -eq 1 ]; then

	device_name="GLaDOS"

elif [ $device -eq 2 ]; then

	device_name="Wheatley"

elif [ $device -eq 3 ]; then

    device_name="Caroline"

fi


### INSTALL DOTFILES

# hypr*
if [ $device -eq 1 || $device -eq 2 ]; then

    if [ -d "$HOME/.config/hypr" ]; then rm -r "$HOME/.config/hypr"; fi

    mkdir -p "$HOME/.config/hypr"

    ln "./$device_name/Hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
    ln "./$device_name/Hypr/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"
    ln "./$device_name/Hypr/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"

fi

# kitty
if [ $device -eq 1 || $device -eq 2 ]; then

    if [ -d "$HOME/.config/kitty" ]; then rm -r "$HOME/.config/kitty"; fi

    mkdir -p "$HOME/.config/kitty"

    ln "./Shared/Kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

fi

# mako
if [ $device -eq 1 || $device -eq 2 ]; then

    if [ -d "$HOME/.config/mako" ]; then rm -r "$HOME/.config/mako"; fi

    mkdir -p "$HOME/.config/mako"

    ln "./Shared/Mako/config" "$HOME/.config/mako/config"

fi

# neovim
if [ -d "$HOME/.config/nvim" ]; then rm -r "$HOME/.config/nvim"; fi

mkdir -p "$HOME/.config/nvim"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln "./Shared/Neovim/init.vim" "$HOME/.config/nvim/init.vim"

# tofi
if [ $device -eq 1 || $device -eq 2 ]; then

    if [ -d "$HOME/.config/tofi" ]; then rm -r "$HOME/.config/tofi"; fi

    mkdir -p "$HOME/.config/tofi"

    ln "./$device_name/Tofi/config" "$HOME/.config/tofi/config"

fi

# wallpaper
if [ $device -eq 1 ]; then

    if [ -f "$HOME/.wallpaper.jpg" ]; then rm "$HOME/.wallpaper.jpg"; fi

    ln "./Wheatley/Wallpaper.jpg" "$HOME/.wallpaper.jpg"

elif [ $device -eq 2 ]; then

    if [ -f "$HOME/.wallpaper-left.png" ]; then rm "$HOME/.wallpaper-left.png"; fi
    if [ -f "$HOME/.wallpaper-right.png" ]; then rm "$HOME/.wallpaper-right.png"; fi

    ln "./GLaDOS/Wallpaper Left.png" "$HOME/.wallpaper-left.png"
    ln "./GLaDOS/Wallpaper Right.png" "$HOME/.wallpaper-right.png"

fi

# waybar
if [ $device -eq 1 || $device -eq 2 ]; then

    if [ -d "$HOME/.config/waybar" ]; then rm -r "$HOME/.config/waybar"; fi

    mkdir -p "$HOME/.config/waybar"

    ln "./$device_name/Waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
    ln "./$device_name/Waybar/style.css" "$HOME/.config/waybar/style.css"

fi

# zsh
if [ -f "$HOME/.antigen.zsh" ]; then rm "$HOME/.antigen.zsh"; fi
if [ -f "$HOME/.zshrc" ]; then rm "$HOME/.zshrc"; fi

curl -L git.io/antigen > $HOME/.antigen.zsh

ln "./Shared/ZSH/zshrc" "$HOME/.zshrc"

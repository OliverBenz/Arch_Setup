#!/bin/bash
# Arch setup script

# Install basic software
sudo pacman -S vim vi man-db man-pages code powertop git base-devel ghc


# Install gnome-terminal-transparency
git clone https://aur.archlinux.org/gnome-terminal-transparency.git
cd gnome-terminal-transparency/
makepkg -si
cd ..
rm -rf gnome-terminal-transparency/


# Onedrive
git clone https://github.com/abraunegg/onedrive.git
sudo pacman -S curl sqlite dmd
cd onedrive/
# TODO: Installation


# VimRC | Bash_Aliases
# ---------------------------------------------------------------
git clone https://github.com/OliverBenz/Arch_Setup.git
cd Arch_Setup
mv .vimrc ~/.vimrc
mv .bash_aliases ~/.bash_aliases

# Icons and Themes
mv Icons.tar.gz ~/.icons/
tar -xvzf ~/.icons/Icons.tar.gz

mv Themes.tar.gz ~/.themes
tar -xvzf ~/.themes/Themes.tar.gz


# TODO: Install snap
# Snap Packages
sudo snap install brave spotify discord


# TODO:
# vimrc
# bash_aliases
# snapd (AUR)
# Keyboard shortcuts

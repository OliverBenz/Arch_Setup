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
mv .vimrc ~/
mv .bash_aliases ~/

# Icons and Themes
mkdir ~/home/$USER/.icons
mv Icons.tar.gz ~/.icons/
tar -xvzf ~/.icons/Icons.tar.gz

mkdir ~/home/$USER/.icons
mv Themes.tar.gz ~/.themes
tar -xvzf ~/.themes/Themes.tar.gz


# Install snap
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
cd ..

# Snap Packages
sudo snap install brave spotify discord


# TODO:
# Keyboard shortcuts

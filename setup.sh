#!/bin/bash
# Arch setup script

# Install basic software
sudo pacman -S vim vi man-db man-pages code git base-devel ghc discord texlive-most texlive-lang gthumb kate mpv vlc okular


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
mv .vimrc ${HOME}/
mv .bash_aliases ${HOME}/

# TODO: Link bash_aliases in bash_rc??
# if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
# fi

# Icons and Themes
mkdir ${HOME}/.icons
mv Icons.tar.gz ${HOME}/.icons/
tar -xvzf ${HOME}/.icons/Icons.tar.gz

mkdir ${HOME}/.icons
mv Themes.tar.gz ${HOME}/.themes
tar -xvzf ${HOME}/.themes/Themes.tar.gz


# Install snap
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
cd ..

# Snap Packages
sudo snap install brave spotify


# TODO:
# Keyboard shortcuts

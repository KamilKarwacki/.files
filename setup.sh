#!/bin/bash

# this script is supposed to one day, be able to get run on a freshly installed regolith
# distro and clone all required repos and install all software to create my personal development
# enviroment

cd ~
sudo apt-get update -qq

# first some basic utilities that are needed
apt-get install git cmake
# regolith specific things
apt-get install regolit-look-*

# lets start with neovim 
# first lets create a software folder and clone git 
mkdir software && cd software
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xvf nvim-linux61.tar.gz
mv nvim-linux61 nvim 
cd ..
echo "# neovim path" >> .bashrc
echo "${HOME}/software/nvim" >> .bashrc

# now get my dotfiles and create a symlink to .config
git clone git@github.com:KamilKarwacki/.files.git
ln -s ${HOME}/.files/nvim ${HOME}/.config

# clone wallpaper repo and put into .wallpapers
git clone git@github.com:KamilKarwacki/wallpapers.git
mv wallpapers .wallpapers

# next the regolith stuff 
# install picom
apt install regolith-compositor-picom-glx
# create symlink from dotfiles
ln -s ${HOME}/.files/regolith2 ${HOME}/.config
# and maybe refresh the look
regolith-look refresh


# lets try to install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# add path to bashrc
cat "export PATH=\$PATH:${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin" >> .bashrc
# install bacon
cargo install --locked bacon

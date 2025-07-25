#!/bin/bash

# this script is supposed to one day, be able to get run on a freshly installed regolith
# distro and clone all required repos and install all software to create my personal development
# enviroment

if ! command -v curl &> /dev/null
then
	sudo apt-get install curl
fi

cd ${HOME} 
sudo apt-get update -qq

# first some basic utilities that are needed
sudo apt-get install git cmake htop g++ pip python-is-python3 python3-pip

# lets start with neovim 
# first lets create a software folder and clone git 
if [ ! -f "./.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

if [ ! -d "software/nvim" ]; then
	mkdir software 
	cd software
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	tar -xvf nvim-linux64.tar.gz
	mv nvim-linux64 nvim 	
	cd ..
	echo "# neovim path" >> .bashrc
	echo "export PATH=\$PATH:\${HOME}/software/nvim/bin" >> .bashrc
  echo "alias vim=nvim" >> .bashrc
	source .bashrc
  echo "IMPORTANT ----------------------- you need to source packer :so and do :Packersync----------------"
fi

# how many miliseconds should pass until a key will be pressed twice and second arg is how many keys per second will be repeated
xset r rate 300 60

#create symbolic link for neovim
if [ ! -L "${HOME}/.config/nvim" ]; then
  ln -s "${HOME}/.files/nvim" "${HOME}/.config"
fi

#create symbolic link for tmux
if [ ! -L "${HOME}/.tmux.config" ]; then
  ln -s "${HOME}/.files/tmux.config" "${HOME}/.tmux.config"
fi


# clone wallpaper repo and put into .wallpapers
if [ ! -d ".wallpapers" ]; then
	git clone git@github.com:KamilKarwacki/wallpapers.git
	mv wallpapers .wallpapers
fi


# next the regolith stuff 
sudo apt-get install regolith-look-blackhole
# install picom
sudo apt-get install regolith-compositor-picom-glx
# create symlink from dotfiles
rm -r ${HOME}/.config/regolith3
ln -s ${HOME}/.files/regolith3 ${HOME}/.config
# and refresh the look
#regolith-look refresh


# lets try to install rust
#if ! command -v cargo &> /dev/null ; then
#  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#  # add path to bashrc
#  #echo "export PATH=\$PATH:\${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin" >> .bashrc
#  source .cargo/env
#  #install bacon
#  cargo install --locked bacon
#fi

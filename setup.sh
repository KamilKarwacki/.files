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
sudo apt-get install git cmake
# regolith specific things
sudo apt-get install regolit-look-*

# lets start with neovim 
# first lets create a software folder and clone git 

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
fi

#create symbolic link for neovim
if [ ! -L "${HOME}/.config/nvim" ]; then
  ln -s "${HOME}/.files/nvim" "${HOME}/.config"
fi


# clone wallpaper repo and put into .wallpapers
if [ ! -d ".wallpapers" ] 
then
	git clone git@github.com:KamilKarwacki/wallpapers.git
	mv wallpapers .wallpapers
fi


# next the regolith stuff 
# install picom
sudo apt install regolith-compositor-picom-glx
# create symlink from dotfiles
if [ ! -L "${HOME}/.config/regolith2" ]; then
  ln -s ${HOME}/.files/regolith2 ${HOME}/.config
fi
# and maybe refresh the look
regolith-look refresh


# lets try to install rust
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# add path to bashrc
#echo "export PATH=\$PATH:\${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin" >> .bashrc
#source .bashrc
# install bacon
#cargo install --locked bacon

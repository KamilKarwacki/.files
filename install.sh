#!/bin/bash
echo "running install.sh"
pwd
ln -s -f /home/KamilKarwacki/.config/coderv2/dotfiles/nvim /home/KamilKarwacki/.config/

if [ ! -f "./.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

sudo apt-get install tmux ripgrep
#create symbolic link for tmux
if [ ! -L "/home/KamilKarwacki/.tmux.config" ]; then
  ln -s /home/KamilKarwacki/.config/coderv2/dotfiles/nvim/tmux.config /home/KamilKarwacki/.tmux.config
fi


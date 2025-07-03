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

sudo ln -f -s /usr/bin/clangd-19 /usr/bin/clangd
sudo ln -f -s /usr/bin/clang-format-19 /usr/bin/clang-format
sudo ln -f -s /usr/bin/lldb-dap-19 /usr/bin/lldb-dap

echo "alias gits=\"git status\"" >> ~/.bashrc
echo "alias sl=ls" >> ~/.bashrc
echo "alias vim=nvim" >> ~/.bashrc

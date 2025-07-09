#!/bin/bash
echo "running install.sh"
pwd
ln -s -f /home/KamilKarwacki/.config/coderv2/dotfiles/nvim /home/KamilKarwacki/.config/

if [ ! -f "./.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

sudo apt-get -y install tmux ripgrep nodejs ninja-build xclip
#create symbolic link for tmux
ln -s -f /home/KamilKarwacki/.config/coderv2/dotfiles/tmux.config /home/KamilKarwacki/.tmux.config

sudo ln -f -s /usr/bin/clangd-19 /usr/bin/clangd
sudo ln -f -s /usr/bin/clang-format-19 /usr/bin/clang-format
sudo ln -f -s /usr/bin/lldb-dap-19 /usr/bin/lldb-dap 

#!/bin/bash
echo "running install.sh"
pwd
ln -s -f $HOME/.config/coderv2/dotfiles/nvim $HOME/.config/

if [ ! -f "./.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

sudo apt-get update
sudo apt-get -y install tmux ripgrep nodejs ninja-build xclip gdb
#create symbolic link for tmux
ln -s -f $HOME/KamilKarwacki/.config/coderv2/dotfiles/tmux.config $HOME/KamilKarwacki/.tmux.config

sudo ln -f -s /usr/bin/clangd-19 /usr/bin/clangd
sudo ln -f -s /usr/bin/clang-format-19 /usr/bin/clang-format
sudo ln -f -s /usr/bin/lldb-dap-19 /usr/bin/lldb-dap 

cat ./rc/bashrc_additions >> $HOME/.bashrc

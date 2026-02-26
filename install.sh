#!/bin/bash
echo "running install.sh"
pwd
ln -s -f $HOME/.config/coderv2/dotfiles/nvim $HOME/.config/

ln -snf $HOME/.config/coderv2/dotfiles/fish_coder $HOME/.config/fish

ln -snf $HOME/.config/coderv2/dotfiles/personalize $HOME/personalize

mkdir $HOME/.config/zellij
ln -s -f $HOME/.config/coderv2/dotfiles/config.kdl $HOME/.config/zellij

if [ ! -f "./.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

sudo apt-get update
sudo apt-get -y install tmux ripgrep nodejs ninja-build xclip gdb fish npm
#create symbolic link for tmux
ln -s -f $HOME/.config/coderv2/dotfiles/tmux.config $HOME/.tmux.config
ln -s -f $HOME/.config/coderv2/dotfiles/gdbinit  $HOME/.gdbinit

sudo ln -f -s /usr/bin/clangd-19 /usr/bin/clangd
sudo ln -f -s /usr/bin/clang-format-19 /usr/bin/clang-format
sudo ln -f -s /usr/bin/lldb-dap-19 /usr/bin/lldb-dap 

cat ./rc/bashrc_additions >> $HOME/.bashrc

# uv 
wget -qO- https://astral.sh/uv/install.sh | sh

# estup fish 
if grep -Fq "exec fish" ~/.bashrc; then
  echo "fish already setup, skipping"
else
   echo -e "\nexec fish\n" >> ~/.bashrc
fi


#!/bin/bash
echo "running install.sh"
pwd
ln -s -f $HOME/.config/coderv2/dotfiles/nvim $HOME/.config/

ln -s -f  $HOME/.config/coderv2/dotfiles/fish_coder $HOME/.config/fish

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

# install zellij
wget https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz
tar xfz zellij-x86_64-unknown-linux-musl.tar.gz
rm zellij-x86_64-unknown-linux-musl.tar.gz
sudo mv zellij /usr/bin

# codex
sudo npm i -g @openai/codex

# estup fish 
if grep -Fq "exec fish" ~/.bashrc; then
  echo "fish already setup, skipping"
else
   echo -e "\nexec fish\n" >> ~/.bashrc
fi


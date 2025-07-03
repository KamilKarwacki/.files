#!/bin/bash
echo "running install.sh"
pwd
rm -r "${HOME}/.config/nvim"
ln -s "./nvim" "${HOME}/.config"

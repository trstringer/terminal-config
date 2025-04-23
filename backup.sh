#!/bin/bash

echo "Backing up Neovim"
set -ex

nvim --version > nvim_version
cp ~/.config/nvim/init.lua .
cp ~/.tmux.conf .
cp ~/.vim_helpers.sh .
cp ~/.config/nvim/lazy-lock.json .
cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-terminal.xml .

nvim --headless "+MasonLock" +q
cp ~/.config/nvim/mason-lock.json .

set +x
echo "Done. Success. Commit changes."

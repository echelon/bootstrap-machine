#!/bin/bash
# Install my personal vim configs, Vundle, and Vundle packages.
git clone git@github.com:dotfile/vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git \
    --depth=1 ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall


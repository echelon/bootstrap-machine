#!/bin/bash
# Install my personal vim configs, Vundle, and Vundle packages.

git clone git@github.com:dotfile/vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git \
    --depth=1 ~/.vim/bundle/Vundle.vim

link_file() {
  config_file=$1
  symlink_name=$2

  if [[ -f $symlink_name ]]; then
    timestamp=$(date +%s)
    cp $symlink_name "${symlink_name}.${timestamp}.backup"
  fi

  ln -sf "${config_file}" "${symlink_name}"
}


link_file ~/.vim/vimrc ~/.vimrc

vim +PluginInstall +qall


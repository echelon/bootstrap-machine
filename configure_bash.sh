#!/bin/bash
# TODO(2015-12-20): My bash dotfiles are in a flaky/disorganized state
git clone git@github.com:dotfile/bash.git ~/.config/bash
ln -s ~/.config/bash/inputrc ~/.inputrc
ln -s ~/.config/bash/logout ~/.bash_logout
ln -s ~/.config/bash/tmux.conf ~/.tmux.conf
echo "Source .config/bash/bash/main from ~/.bashrc"


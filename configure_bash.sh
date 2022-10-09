#!/bin/bash
# TODO(2015-12-20): My bash dotfiles are in a flaky/disorganized state

set -euxo pipefail

git clone git@github.com:dotfile/bash.git ~/.config/bash

ln -s ~/.config/bash/tmux.conf ~/.tmux.conf
ln -s ~/.config/bash/inputrc ~/.inputrc
ln -s ~/.config/bash/logout ~/.bash_logout

echo "Source .config/bash/bash/main from ~/.bashrc"


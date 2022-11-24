#!/bin/bash
# TODO(2015-12-20): My bash dotfiles are in a flaky/disorganized state

set -euxo pipefail

echo "Cloning and installing general bash configs..."
git clone git@github.com:dotfile/bash.git ~/.config/bash

ln -s ~/.config/bash/tmux.conf ~/.tmux.conf
ln -s ~/.config/bash/inputrc ~/.inputrc
ln -s ~/.config/bash/logout ~/.bash_logout

echo ">> Remember to source .config/bash/bash/main from ~/.bashrc"

echo "Cloning and installing general bash aliases..."
git clone git@github.com:dotfile/bash_aliases.git ~/.config/bash_aliases

/bin/bash ~/.config/bash_aliases/install.sh



#!/bin/bash
# TODO(2015-12-20): My bash dotfiles are in a flaky/disorganized state

set -euxo pipefail

bash_configs=~/.config/bash

if [[ ! -d $bash_configs ]]; then 
  echo "Cloning and installing general bash configs..."
  git clone git@github.com:dotfile/bash.git $bash_configs
fi

link_file() {
  config_file=$1
  symlink_name=$2

	if [[ -f $symlink_name ]]; then 
    timestamp=$(date +%s)
		cp $symlink_name "${symlink_name}.${timestamp}.backup"
	fi

	ln -sf "${config_file}" "${symlink_name}"
}

link_file ~/.config/bash/tmux.conf ~/.tmux.conf
link_file ~/.config/bash/inputrc ~/.inputrc
link_file ~/.config/bash/logout ~/.bash_logout

echo ">> Remember to source .config/bash/bash/main from ~/.bashrc"

bash_aliases_configs=~/.config/bash_aliases

if [[ ! -d $bash_aliases_configs ]]; then 
  echo "Cloning and installing general bash aliases..."
  git clone git@github.com:dotfile/bash_aliases.git $bash_aliases_configs
fi

echo "Updating general bash aliases..."
pushd "$bash_aliases_configs"
git pull
popd

/bin/bash ~/.config/bash_aliases/install.sh


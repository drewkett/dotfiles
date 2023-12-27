#!/bin/bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -f vimrc ~/.vimrc
ln -f tmux.conf ~/.tmux.conf

git config --global core.excludesFile '~/.gitignore'
ln -f gitignore ~/.gitignore

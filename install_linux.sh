#!/bin/bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.config/nvim
ln -sf "${SCRIPT_DIR}/init.lua" ~/.config/nvim/
ln -sf "${SCRIPT_DIR}/tmux.conf" ~/.tmux.conf
# ln -sf "${SCRIPT_DIR}/bashrc" ~/.bashrc

git config --global core.excludesFile '~/.gitignore'
ln -sf "${SCRIPT_DIR}/gitignore" ~/.gitignore

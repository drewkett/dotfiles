#!/bin/bash

set -euxo pipefail

rustup update stable

# https://github.com/sts10/rust-command-line-utilities
PACKAGES="ripgrep fd-find pueue bat broot starship cargo-update bottom dua-cli jj-cli"
cargo install $PACKAGES
# To update
# cargo install-update -a

#cargo install --no-track --root tmp jj-cli --bin jj
#cargo install --no-track --root tmp --git https://github.com/bvaisvil/zenith.git

#cargo install --no-track --root tmp --git https://github.com/drewkett/hcp.git
#sudo cp tmp/bin/* /usr/local/bin/

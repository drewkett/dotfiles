#!/bin/bash

set -euxo pipefail

export RUSTFLAGS="-Ctarget-cpu=native"
cargo install --no-track --root tmp ripgrep fd-find pueue bat broot starship
cargo install --no-track --root tmp --git https://github.com/bvaisvil/zenith.git
cargo install --no-track --root tmp --git https://github.com/drewkett/hcp.git
sudo cp tmp/bin/* /usr/local/bin/

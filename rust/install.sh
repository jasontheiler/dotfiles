#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Rust using rustup.
# See: https://www.rust-lang.org/
curl -fsSL https://sh.rustup.rs | sh -s -- -y --no-modify-path

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "${HOME}/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "${dir}/rust.fish" "${HOME}/.config/fish/conf.d"

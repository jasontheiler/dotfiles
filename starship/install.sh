#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Starship.
# See: https://starship.rs/
curl -fsSL https://starship.rs/install.sh | sudo bash -s -- -b /usr/local/bin -y

# Creates a .config directory if none exists.
mkdir -p "$HOME/.config"

# Creates a symbolic link to the configuration file.
ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

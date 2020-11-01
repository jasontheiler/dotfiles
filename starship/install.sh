#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Starship.
# See: https://starship.rs/
if [ "$PORTABLE" != "true" ]; then
  curl -fsSL https://starship.rs/install.sh | sudo bash -s -- -b "/usr/local/bin" -y
else
  curl -fsSL https://starship.rs/install.sh | bash -s -- -b "${HOME}/.bin" -y
fi

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config"

# Creates a symbolic link to the configuration file.
ln -sf "${DOTFILES}/starship/starship.toml" "${HOME}/.config/starship.toml"

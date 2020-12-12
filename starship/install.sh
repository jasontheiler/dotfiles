#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Starship.
# See: https://starship.rs/
curl -fsSL https://starship.rs/install.sh | bash -s -- -b "${HOME}/.local/bin" -y

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config"

# Creates a symbolic link to the Starship configuration file.
ln -sf "${dir}/starship.toml" "${HOME}/.config/starship.toml"

# Creates a .config/fish/conf.d directory if none exists.
mkdir -p "${HOME}/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "${dir}/starship.fish" "${HOME}/.config/fish/conf.d/starship.fish"

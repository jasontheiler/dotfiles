#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Starship.
# See: https://starship.rs/
curl -fsSL https://starship.rs/install.sh | bash -s -- -b "${HOME}/.local/bin" -y

# Retrieves the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config"

# Creates a symbolic link to the configuration file.
ln -sf "${dir}/starship.toml" "${HOME}/.config/starship.toml"

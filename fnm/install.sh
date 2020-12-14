#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Fast Node Manager.
# See: https://fnm.vercel.app/
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "${HOME}/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "${dir}/fnm.fish" "${HOME}/.config/fish/conf.d"

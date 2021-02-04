#!/bin/sh

# Traps exits to clean up leftover files and directories.
trap 'rm -rf /tmp/exa.zip /tmp/exa' EXIT

# Exits immediately if an error occurs.
set -e

# Creates a temporary /tmp/exa directory if none exists.
mkdir -p /tmp/exa

# Creates a ~/.local/bin directory if none exists.
mkdir -p "${HOME}/.local/bin"

# Installs exa.
# See: https://the.exa.website/
curl -fsSL "$(curl -fsSL https://api.github.com/repos/ogham/exa/releases/latest | grep "browser_download_url.*exa-linux-x86_64.*.zip" | cut -d ":" -f 2,3 | tr -d \" | tr -d " ")" -o /tmp/exa.zip
unzip -u /tmp/exa.zip -d /tmp/exa
mv -f /tmp/exa/exa-linux-x86_64 "${HOME}/.local/bin/exa"

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "${HOME}/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "${dir}/exa.fish" "${HOME}/.config/fish/conf.d"

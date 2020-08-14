#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Antibody.
# See: https://getantibody.github.io/
curl -fsSL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin

# Bundles plugins.
antibody bundle < "$DOTFILES/antibody/bundle.txt" > "$HOME/.zsh_plugins"

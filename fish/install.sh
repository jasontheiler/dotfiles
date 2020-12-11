#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config"

# Creates symbolic links to all configuration files.
find "${DOTFILES}/fish" -name "*fish*" -type f | while read -r src; do
  ln -sf "$src" "${HOME}/.config/fish/$(basename "$src")"
done

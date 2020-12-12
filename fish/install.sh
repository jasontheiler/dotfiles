#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config/fish"

# Creates symbolic links to all configuration files.
find "${DOTFILES}/fish" -maxdepth 1 -name "*.fish" -type f | while read -r src; do
  ln -sf "$src" "${HOME}/.config/fish/$(basename "$src")"
done

# Creates a .config directory if none exists.
mkdir -p "${HOME}/.config/fish/functions"

# Creates symbolic links to all configuration files.
find "${DOTFILES}/fish/functions" -name "*.fish" -type f | while read -r src; do
  ln -sf "$src" "${HOME}/.config/fish/functions/$(basename "$src")"
done

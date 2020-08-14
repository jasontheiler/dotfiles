#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Creates symbolic links to all configuration files.
find "$DOTFILES/zsh" -name "zsh*" -type f | while read -r src; do
  ln -sf "$src" "$HOME/.$(basename $src)"
done

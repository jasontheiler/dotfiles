#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Antibody and bundles plugins.
# See: https://getantibody.github.io/
if [ "$PORTABLE" != true ]; then
  curl -fsSL https://git.io/antibody | sudo sh -s -- -b "/usr/local/bin"
  antibody bundle < "${DOTFILES}/antibody/bundle.txt" > "${HOME}/.zsh_plugins"
else
  curl -fsSL https://git.io/antibody | sh -s -- -b "${HOME}/.local/bin"
  "${HOME}/.local/bin/antibody" bundle < "${DOTFILES}/antibody/bundle.txt" > "${HOME}/.zsh_plugins"
fi

#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Antibody.
# See: https://getantibody.github.io/
if [ "$PORTABLE" != "true" ]; then
  curl -fsSL https://git.io/antibody | sudo sh -s -- -b "/usr/local/bin"
else
  curl -fsSL https://git.io/antibody | sh -s -- -b "${HOME}/.bin"
fi

# Bundles plugins.
antibody bundle < "${DOTFILES}/antibody/bundle.txt" > "${HOME}/.zsh_plugins"

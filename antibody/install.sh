#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Installs Antibody.
# See: https://getantibody.github.io/
curl -fsSL https://git.io/antibody | sh -s -- -b "${HOME}/.local/bin"

# Bundles plugins.
"${HOME}/.local/bin/antibody" bundle < "${DOTFILES}/antibody/bundle.txt" > "${HOME}/.zsh_plugins"

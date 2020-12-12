#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Retrieves the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a .config/fish/functions directory if none exists.
mkdir -p "${HOME}/.config/fish/functions"

# Creates symbolic links to all configuration files.
find "$dir" -maxdepth 1 -name "*.fish" -type f | while read -r file; do
  ln -sf "$file" "${HOME}/.config/fish/functions/$(basename "$file")"
done

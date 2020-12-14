#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "${HOME}/.config/fish/conf.d"

# Creates symbolic links to all conf.d configuration files.
find "${dir}/conf.d" -maxdepth 1 -name "*.fish" -type f | while read -r file; do
    ln -sf "$file" "${HOME}/.config/fish/conf.d"
done

# Creates a ~/.config/fish/functions directory if none exists.
mkdir -p "${HOME}/.config/fish/functions"

# Creates symbolic links to all function files.
find "${dir}/functions" -maxdepth 1 -name "*.fish" -type f | while read -r file; do
    ln -sf "$file" "${HOME}/.config/fish/functions"
done

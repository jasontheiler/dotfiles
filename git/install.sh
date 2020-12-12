#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Retrieves the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a symbolic link to the configuration file.
ln -sf "${dir}/gitconfig" "${HOME}/.gitconfig"

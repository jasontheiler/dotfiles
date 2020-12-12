#!/bin/sh

# Exits immediately if an error occurs.
set -e

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Creates a symbolic link to the Git configuration file.
ln -sf "${dir}/gitconfig" "${HOME}/.gitconfig"

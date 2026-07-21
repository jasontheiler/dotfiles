#!/usr/bin/env bash

set -euo pipefail

TMUX_VERSION=${TMUX_VERSION:-3.7b}
PREFIX=${PREFIX:-$HOME/.local}
SCRIPT_DIR=$(dirname "$(realpath "$0")")
PATCHES="$SCRIPT_DIR/tmux-${TMUX_VERSION}-*.patch"

for cmd in git patch sh autoconf automake bison gcc make pkg-config sudo; do
    command -v "$cmd" >/dev/null || { echo "missing dependency: $cmd" >&2; exit 1; }
done

WORKDIR=$(mktemp -d /tmp/tmux-patched.XXXXXX)
echo ">> building tmux $TMUX_VERSION in $WORKDIR"

git clone --depth=1 --branch="$TMUX_VERSION" https://github.com/tmux/tmux.git "$WORKDIR"
cd "$WORKDIR"

for patch in $PATCHES; do
    patch -p1 < "$patch"
    echo ">> applying patch $patch"
done

sh autogen.sh
./configure --prefix="$PREFIX"
make -j"$(nproc)"

echo ">> installing to $PREFIX"
make install

rm -rf "$WORKDIR"

echo
echo ">> installed: $("$PREFIX/bin/tmux" -V) at $PREFIX/bin/tmux"
echo ">> restart the tmux server to pick it up:  tmux kill-server"
echo ">> uninstall:  rm $PREFIX/bin/tmux $PREFIX/share/man/man1/tmux.1"

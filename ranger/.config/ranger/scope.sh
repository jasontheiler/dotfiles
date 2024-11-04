#!/bin/bash
# See: https://github.com/ranger/ranger/wiki/Official-User-Guide#configuration

if command -v bat &>/dev/null; then
    bat --style=plain --color=always --theme=base16 -- "${1}" && exit 5
else
    cat -- "${1}" && exit 5
fi

exit 1

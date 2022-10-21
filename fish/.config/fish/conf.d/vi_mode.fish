# Enables Vi mode to allow usage of Vi-like commands in fish.
# See: https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

# Changes the cursor's shape depending on the current Vi mode.
set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

bind -s -M insert \ch backward-char
bind -s -M insert \cj down-or-search
bind -s -M insert \ck up-or-search
bind -s -M insert \cl forward-char

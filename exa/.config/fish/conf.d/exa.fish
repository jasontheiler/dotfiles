# Sets colors for exa.
# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

# Adds exa abbreviations.
abbr -a l exa -F --tree -L 1
abbr -a la exa -Fa --tree -L 1
abbr -a ll exa -Fl --git --tree -L 1
abbr -a lla exa -Fla --git --tree -L 1
abbr -a t exa -F --tree -L
abbr -a ta exa -Fa --tree -L
abbr -a tl exa -Fl --git --tree -L
abbr -a tla exa -Fla --git --tree -L

# Sets colors for exa.
# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

# Adds exa abbreviations.
abbr -a l exa -F
abbr -a la exa -Fa
abbr -a ll exa -Fl --git
abbr -a lla exa -Fla --git

# Adds exa --tree -L abbreviations.
abbr -a t exa -F --tree -L
abbr -a ta exa -Fa --tree -L
abbr -a tl exa -Fl --git --tree -L
abbr -a tla exa -Fla --git --tree -L

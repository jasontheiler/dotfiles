# Sets colors for exa.
# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

# Adds exa abbreviations.
abbr -a l exa -F
abbr -a la exa -aF
abbr -a ll exa -lF --git
abbr -a lla exa -alF --git

# Adds exa --tree abbreviations.
abbr -a t exa --tree -F
abbr -a ta exa --tree -aF
abbr -a tl exa --tree -lF --git
abbr -a tla exa --tree -alF --git

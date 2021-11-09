# Sets colors for exa.
# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

# Adds exa abbreviations.
abbr -a l exa -Fs type --tree -L 1
abbr -a la exa -Fas type --tree -L 1
abbr -a ll exa -Fls type --git --tree -L 1
abbr -a lla exa -Flas type --git --tree -L 1
abbr -a t exa -Fs type --tree -L
abbr -a ta exa -Fas type --tree -L
abbr -a tl exa -Fls type --git --tree -L
abbr -a tla exa -Flas type --git --tree -L

# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

abbr -a l exa -Fs type --tree -L 1
abbr -a la exa -Fas type --tree -L 1
abbr -a ll exa -Fls type --git --tree -L 1
abbr -a lla exa -Flas type --git --tree -L 1

for i in 2 3 4 5 6 7 8 9
    abbr -a l$i exa -Fs type --tree -L $i
    abbr -a la$i exa -Fas type --tree -L $i
    abbr -a ll$i exa -Fls type --git --tree -L $i
    abbr -a lla$i exa -Flas type --git --tree -L $i
end

# See: https://the.exa.website/docs/colour-themes
set -x EXA_COLORS "xx=1;30"

for i in 1 2 3 4 5 6 7 8 9
    abbr -a l(string replace -r "^1\$" "" $i) exa -Fs type --tree -L $i
    abbr -a la(string replace -r "^1\$" "" $i) exa -Fas type --tree -L $i
    abbr -a ll(string replace -r "^1\$" "" $i) exa -Fls type --git --tree -L $i
    abbr -a lla(string replace -r "^1\$" "" $i) exa -Flas type --git --tree -L $i
end

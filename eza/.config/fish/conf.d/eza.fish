for i in 1 2 3 4 5 6 7 8 9
    abbr -a l(string replace -r "^1\$" "" $i) eza -Fs type --tree -L $i
    abbr -a la(string replace -r "^1\$" "" $i) eza -Fas type --tree -L $i
    abbr -a ll(string replace -r "^1\$" "" $i) eza -Fls type --git --tree -L $i
    abbr -a lla(string replace -r "^1\$" "" $i) eza -Flas type --git --tree -L $i
end

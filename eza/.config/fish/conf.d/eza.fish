for i in (seq 1 9)
    abbr -a l(string replace -r '^1$' "" $i) eza -F auto -s type -TL $i
    abbr -a la(string replace -r '^1$' "" $i) eza -aF auto -s type -TL $i
    abbr -a ll(string replace -r '^1$' "" $i) eza -lF auto -s type --git -TL $i
    abbr -a lla(string replace -r '^1$' "" $i) eza -laF auto -s type --git -TL $i
end

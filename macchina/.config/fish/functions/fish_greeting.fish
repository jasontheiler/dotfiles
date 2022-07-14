# Prints fish's greeting.
function fish_greeting
    # Disables echoing of input characters.
    stty -echo 2>/dev/null

    if test "$GREETING" != false
        macchina
    end
end

# Prints fish's greeting.
function fish_greeting
    # Disables echoing of input characters.
    stty -echo 2>/dev/null

    if [ "$GREETING" != false ]
        echo
        pfetch
    end
end

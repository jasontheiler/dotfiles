# Prints the greeting.
function fish_greeting
    # Disables echoing of input characters.
    stty -echo 2>/dev/null

    echo
    pfetch
end

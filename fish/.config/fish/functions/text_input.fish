# Prompts the user to input text.
function text_input -d "Prompts the user to input text."
    argparse --ignore-unknown i/inline  -- $argv

    read -P "$(
        echo -es \
            \n \
            (set_color blue) \
            "? " \
            (set_color normal) \
            $argv \
            (set_color normal) \
            (
                if test -z $_flag_inline
                    echo '\n'
                else
                    echo ' '
                end
            ) \
            (set_color green) \
            "❯ " \
            (set_color normal)
    )" value

    echo $value
end

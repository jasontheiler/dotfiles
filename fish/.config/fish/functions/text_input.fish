# Prompts the user to input text.
function text_input -d "Prompts the user to input text."
    argparse i/inline t/trim -- $argv

    read -P "$(
        echo -es \
            \n \
            (set_color blue) \
            "? " \
            (set_color normal) \
            $argv \
            (set_color normal) \
            (
                if set -q _flag_inline
                    echo ' '
                else
                    echo '\n'
                end
            ) \
            (set_color green) \
            "❯ " \
            (set_color normal)
    )" value

    if set -q _flag_trim
        set value (string trim $value)
    end

    echo $value
end

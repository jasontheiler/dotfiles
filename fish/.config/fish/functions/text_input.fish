# Prompts the user to input text.
function text_input -d "Prompts the user to input text."
    read -P "$( \
        echo -es \
            \n \
            (set_color blue) \
            "? " \
            (set_color normal) \
            $argv \
            (set_color normal) \
            \n \
            (set_color green) \
            "❯ " \
            (set_color normal)
    )" value

    echo $value
end

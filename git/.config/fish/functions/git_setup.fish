# Prompts the user and reads their input.
function prompt_read
    function prompt
        echo -se \
            \n \
            (set_color blue) \
            "? " \
            (set_color normal) \
            "$argv[1]" \
            \n \
            (set_color green) \
            "❯ " \
            (set_color normal)
    end

    read -p "prompt \"$argv[1]\"" value

    echo $value
end

# Sets up the user's Git configuration.
function git_setup -d "Sets up the user's Git configuration."
    if contains -- -g $argv || [ ! -d ./.git/ ]
        set scope global
        set file --global
    else
        set scope local
        set file --local
    end

    # Shows the user the determined scope.
    echo -se \n (set_color yellow) "!" (set_color normal) " Scope: " (set_color -u) $scope

    # Sets the path for included Git defaults.
    if [ "$scope" = global ]
        git config $file include.path "~/.gitconfig_defaults"
    end

    # Prompts the user to set a Git author email.
    set user_email (prompt_read "What is your Git author email?")

    # Sets the user's Git author email if the input is not empty.
    if [ -n "$user_email" ]
        git config $file user.email "$user_email"
    end

    # Prompts the user to set a Git author name.
    set user_name (prompt_read "What is your Git author name?")

    # Sets the user's Git author name if the input is not empty.
    if [ -n "$user_name" ]
        git config $file user.name "$user_name"
    end

    # Prompts the user to set a GPG signing key ID.
    set user_signingkey (prompt_read "What is your GPG signing key ID?\n (This will enable GPG commit signing.)")

    # Sets the user's GPG signing key ID and enables GPG commit signing if the input is not empty.
    if [ -n "$user_signingkey" ]
        git config $file user.signingkey "$user_signingkey"
        git config $file commit.gpgsign true
    end
end

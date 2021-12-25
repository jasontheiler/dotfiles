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
        set location global
        set git_config_location --file "$HOME/.gitconfig_user"
    else
        set location local
    end

    # Sets the Windows Git credential helper as the default Git credential helper if the current OS
    # is a WSL2 instance, the Windows Git credential helper is installed in its default directory
    # and none other is configured.
    # See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
    if [ "$location" = global ] \
            && [ -z (git config $git_config_location --get credential.helper) ] \
            && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe" ]
        git config \
            $git_config_location \
            credential.helper \
            "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
    end

    # Prompts the user to set a Git author email.
    set user_email (prompt_read "What is your $location Git author email?")

    # Sets the user's Git author email if the input is not empty.
    if [ -n "$user_email" ]
        git config $git_config_location user.email "$user_email"
    end

    # Prompts the user to set a Git author name.
    set user_name (prompt_read "What is your $location Git author name?")

    # Sets the user's Git author name if the input is not empty.
    if [ -n "$user_name" ]
        git config $git_config_location user.name "$user_name"
    end

    # Prompts the user to set a GPG signing key ID.
    set user_signingkey (prompt_read "What is your $location GPG signing key ID?\n (This will enable GPG commit signing $location \bly.)")

    # Sets the user's GPG signing key ID and enables GPG commit signing if the input is not empty.
    if [ -n "$user_signingkey" ]
        git config $git_config_location user.signingkey "$user_signingkey"
        git config $git_config_location commit.gpgsign true
    end
end

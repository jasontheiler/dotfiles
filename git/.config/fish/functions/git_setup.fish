# Sets up the user's Git configuration.
function git_setup
    # Sets the Windows Git credential helper as the default Git credential helper if the current OS
    # is a WSL2 instance, the Windows Git credential helper is installed in its default directory
    # and none is configured.
    # See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
    if [ -z (git config --file "$HOME/.gitconfig_user" --get credential.helper) ] \
            && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe" ]
        git config \
            --file "$HOME/.gitconfig_user" \
            credential.helper \
            "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
    end

    # Prompts the user to set a default Git author email.
    echo -s \n (set_color cyan) "? " (set_color normal) "What is your default Git author email?"

    function prompt
        echo -n -s (set_color green) "❯ " (set_color normal)
    end

    read -p prompt user_email

    # Sets the user's default Git author email if the input is not empty.
    if [ -n "$user_email" ]
        git config --file "$HOME/.gitconfig_user" user.email "$user_email"
    end

    # Prompts the user to set a default Git author name.
    echo -s \n (set_color cyan) "? " (set_color normal) "What is your default Git author name?"

    function prompt
        echo -n -s (set_color green) "❯ " (set_color normal)
    end

    read -p prompt user_name

    # Sets the user's default Git author name if the input is not empty.
    if [ -n "$user_name" ]
        git config --file "$HOME/.gitconfig_user" user.name "$user_name"
    end

    # Prompts the user to set a default GPG signing key ID.
    echo -s \
        \n \
        (set_color cyan) \
        "? " \
        (set_color normal) \
        "What is your default GPG signing key ID?" \
        \n \
        "  (This will enable GPG commit signing by default.)"

    function prompt
        echo -n -s (set_color green) "❯ " (set_color normal)
    end

    read -p prompt signing_key

    # Sets the user's default GPG signing key ID and enables GPG commit signing by default if the
    # input is not empty.
    if [ -n "$signing_key" ]
        git config --file "$HOME/.gitconfig_user" user.signingkey "$signing_key"
        git config --file "$HOME/.gitconfig_user" commit.gpgsign true
    end

    echo
end

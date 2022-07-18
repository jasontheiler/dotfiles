# Sets up the user's Git configuration.
function git_setup -d "Sets up the Git repository configuration."
    # Throws an error if the directory is not a Git repository.
    if not test -d ./.git/
        alert error "Current directory is not a Git repository."
        return 1
    end

    # Prompts the user to set a Git author email.
    set user_email (text_input "What is your Git author email?")

    # Sets the user's Git author email if the input is not empty.
    if test -n "$user_email"
        git config --local user.email "$user_email"
    end

    # Prompts the user to set a Git author name.
    set user_name (text_input "What is your Git author name?")

    # Sets the user's Git author name if the input is not empty.
    if test -n "$user_name"
        git config --local user.name "$user_name"
    end

    # Prompts the user to set a GPG signing key ID.
    set user_signingkey (
        text_input \
            "What is your GPG signing key ID?" \
            \n \
            (set_color brblack) \
            " (This will enable GPG commit signing.)"
    )

    # Sets the user's GPG signing key ID and enables GPG commit signing if the input is not empty.
    if test -n "$user_signingkey"
        git config --local user.signingkey "$user_signingkey"
        git config --local commit.gpgsign true
    end
end

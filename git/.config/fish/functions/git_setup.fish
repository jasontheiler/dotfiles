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
function git_setup -d "Sets up the Git repository configuration."
    # Throws an error if the directory is not a Git repository.
    if not test -d ./.git/
        echo -se \
            \n \
            (set_color -r red) \
            " ! ERROR: " \
            (set_color normal) \
            (set_color red) \
            " Current directory is not a Git repository."
        return 1
    end

    # for config_path in $HOME/**/.git/config
    #     set -l new_profile \
    #         (git config -f $config_path --default "" --get user.email) \
    #         (git config -f $config_path --default "" --get user.name) \
    #         (git config -f $config_path --default "" --get user.signingkey)

    #     # Skips if the new profile is empty.
    #     if test -z (string join "" $new_profile)
    #         continue
    #     end

    #     set -l repo_path (string replace -r '.git/config$' "" $config_path)
    #     set -l profile_exists

    #     # Checks if the profile already exists.
    #     for profile_key in $profiles
    #         if test "$$profile_key" = "$new_profile"
    #             set -a {$profile_key}_repos (string split / $repo_path)[-2]
    #             set profile_exists true
    #             break
    #         end
    #     end

    #     if not test $profile_exists
    #         set -l new_profile_key (string escape --style var $repo_path)
    #         set -f $new_profile_key $new_profile
    #         set -fa profiles $new_profile_key
    #         set -f {$new_profile_key}_repos (string split / $repo_path)[-2]
    #     end
    # end

    # for profile_key in $profiles
    #     echo $$profile_key
    #     set -l repos_key {$profile_key}_repos
    #     echo -s \
    #         (set_color brblack) \
    #         "Used in " \
    #         (string join ", " $$repos_key) \
    #         (set_color normal)
    # end

    # Prompts the user to set a Git author email.
    set -f user_email (prompt_read "What is your Git author email?")

    # Sets the user's Git author email if the input is not empty.
    if test -n "$user_email"
        git config --local user.email "$user_email"
    end

    # Prompts the user to set a Git author name.
    set -f user_name (prompt_read "What is your Git author name?")

    # Sets the user's Git author name if the input is not empty.
    if test -n "$user_name"
        git config --local user.name "$user_name"
    end

    # Prompts the user to set a GPG signing key ID.
    set -f user_signingkey (prompt_read "What is your GPG signing key ID?\n (This will enable GPG commit signing.)")

    # Sets the user's GPG signing key ID and enables GPG commit signing if the input is not empty.
    if test -n "$user_signingkey"
        git config --local user.signingkey "$user_signingkey"
        git config --local commit.gpgsign true
    end
end

# Sets up the user's Git configuration.
function git_profile -d "Sets up the Git repository configuration."
    if not test -d ./.git/
        alert error "Current directory is not a Git repository."
        return 1
    end

    for config_path in $HOME/{.,}*{,/{.,}*}/.git/config
        set -l new_profile \
            (git config -f $config_path --default "" --get user.email) \
            (git config -f $config_path --default "" --get user.name) \
            (git config -f $config_path --default "" --get user.signingkey)

        # Skips if the new profile is empty.
        if test -z (string join0 $new_profile)
            continue
        end

        set -l repo_path (string replace -r '.git/config$' "" $config_path)
        set -l profile_exists false

        # Checks if the profile already exists.
        for profile_key in $profiles
            if test "$$profile_key" = "$new_profile"
                set -a {$profile_key}_repos (string split / $repo_path)[-2]
                set profile_exists true
                break
            end
        end

        if not $profile_exists
            set -l new_profile_key (string escape --style var $repo_path)
            set -f $new_profile_key $new_profile
            set -fa profiles $new_profile_key
            set -f {$new_profile_key}_repos (string split / $repo_path)[-2]
        end
    end

    # Sorts the profiles by repo count using Bubblesort.
    set -l i 1
    while test $i -le (count $profiles)
        set -l has_swapped false

        set -l j 1
        while test $j -le (math (count $profiles) - $i)
            set -l j1 (math $j + 1)
            set -l j_repos_key {$profiles[$j]}_repos
            set -l j1_repos_key {$profiles[$j1]}_repos

            if test (count $$j_repos_key) -lt (count $$j1_repos_key)
                set -l temp $profiles[$j]
                set profiles[$j] $profiles[$j1]
                set profiles[$j1] $temp
                set has_swapped true
            end

            set j $j1
        end

        if not $has_swapped
            break
        end

        set i (math $i + 1)
    end

    set -l i (count $profiles)
    while test $i -ge 1
        set -l repos_key {$profiles[$i]}_repos
        set -l repos_str (
            string join ", " \
                $$repos_key[1][1..3] \
                (
                    if test (count $$repos_key) -gt 3
                        echo (math (count $$repos_key) - 3) more
                    end
                ) \
            # Replaces the last `,` with `and`.
            | string replace -r ',(?=[^,]*$)' " and"
        )

        echo -es \
            \n \
            (set_color -ou) \
            "Profile #$i:" \
            (set_color normal) \
            \n\n \
            "     Email address: " \
            $$profiles[$i][1] \
            \n \
            "              Name: " \
            $$profiles[$i][2] \
            \n \
            "GPG signing key ID: " \
            $$profiles[$i][3] \
            \n\n \
            (set_color brblack) \
            "(Used in " \
            $repos_str \
            ".)" \
            (set_color normal)

        set i (math $i - 1)
    end

    if test (count $profiles) -gt 0
        echo

        set is_valid false
        while not $is_valid
            set -l answer (
                text_input -i \
                    "Apply an existing profile " \
                    (set_color brblack) \
                    "[" \
                    (set_color blue) \
                    "1" \
                    (
                        if test (count $profiles) -gt 1
                            math (count $profiles) \* -1
                        end
                    ) \
                    (set_color normal) \
                    (set_color brblack) \
                    "]" \
                    (set_color normal) \
                    " or create a new one " \
                    (set_color brblack) \
                    "[" \
                    (set_color blue) \
                    "new" \
                    (set_color brblack) \
                    "]" \
                    (set_color normal) \
                    "?"
            )

            set is_valid true
        end
    else
        alert info "No existing profiles found. Creating a new one..."
    end

    echo

    set user_email (text_input "What is your email address?")
    set user_name (text_input "What is your name?")
    set user_signingkey (
        text_input \
            "What is your GPG signing key ID?" \
            \n \
            (set_color brblack) \
            " (This will enable GPG commit signing.)"
    )

    if test -n "$user_email"
        git config --local user.email "$user_email"
    end

    if test -n "$user_name"
        git config --local user.name "$user_name"
    end

    if test -n "$user_signingkey"
        git config --local user.signingkey "$user_signingkey"
        git config --local commit.gpgsign true
    end
end

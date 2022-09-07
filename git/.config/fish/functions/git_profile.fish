# Sets up the user's Git configuration.
function git_profile -d "Sets up the Git repository configuration."
    if not test -d ./.git/
        alert error "Current directory is not a Git repository!" \n
        return 1
    end

    if contains -- -d $argv
        set has_flag_depth
    end
    argparse "d/depth=" h/hidden -- $argv 2>/dev/null

    if not set -q has_flag_depth
        set _flag_depth 3
    else if not string match -qr '^\d+$' -- $_flag_depth
        or test $_flag_depth -lt 1
        alert error "Invalid depth: " `$_flag_depth` \n
        return 1
    end

    for config_path in $HOME/{.,}*{,/{.,}*}{,/{.,}*}/.git/config
        set -l profile \
            (git config -f $config_path --default "" --get user.email) \
            (git config -f $config_path --default "" --get user.name) \
            (git config -f $config_path --default "" --get user.signingkey)

        # Skips if the profile is empty.
        if test -z (string join0 $profile)
            continue
        end

        set -l repo_path (string replace -r '.git/config$' "" $config_path)
        set -l profile_exists false

        # Checks if the profile already exists.
        for profile_key in $profiles
            if test "$$profile_key" = "$profile"
                set -a {$profile_key}_repos (string split / $repo_path)[-2]
                set profile_exists true
                break
            end
        end

        if not $profile_exists
            set -l profile_key (string escape --style var $repo_path)
            set -f $profile_key $profile
            set -fa profiles $profile_key
            set -f {$profile_key}_repos (string split / $repo_path)[-2]
        end
    end

    set profiles_len (count $profiles)
    if test $profiles_len -gt 0
        set has_profiles true
    else
        set has_profiles false
    end

    # Sorts the profiles by repo count using Bubblesort.
    for i in (seq 1 $profiles_len)
        set -l has_swapped false

        for j in (seq 1 (math $profiles_len - $i))
            set -l j1 (math $j + 1)
            set -l j_repos_key {$profiles[$j]}_repos
            set -l j1_repos_key {$profiles[$j1]}_repos

            if test (count $$j_repos_key) -lt (count $$j1_repos_key)
                set -l temp $profiles[$j]
                set profiles[$j] $profiles[$j1]
                set profiles[$j1] $temp
                set has_swapped true
            end
        end

        if not $has_swapped
            break
        end
    end

    if not $has_profiles
        alert info "No existing profiles found."
    end

    for i in (seq 1 $profiles_len)[-1..1]
        set -l repos_key {$profiles[$i]}_repos
        set -l repos_str (
            string join ", " \
                $$repos_key[1][1..3] \
                (if test (count $$repos_key) -gt 3; echo (math (count $$repos_key) - 3) more; end) \
                # Replaces the last `,` with ` and`.
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
    end

    echo

    while not set -q answer
        set answer (
            text_input -it \
                (
                    if $has_profiles
                        echo -s \
                            "Apply an existing profile " \
                            (set_color brblack) \
                            "[" \
                            (set_color blue) \
                            "1" \
                            (
                                if test $profiles_len -gt 1
                                    math $profiles_len \* -1
                                end
                            ) \
                            (set_color normal) \
                            (set_color brblack) \
                            "]" \
                            (set_color normal) \
                            ", "
                    end
                ) \
                (if $has_profiles; echo c; else; echo C; end) \
                "reate a new " \
                (if $has_profiles; echo one; else; echo profile; end) \
                (set_color brblack) \
                " [" \
                (set_color blue) \
                "n" \
                (set_color brblack) \
                "]" \
                (set_color normal) \
                " or quit " \
                (set_color brblack) \
                "[" \
                (set_color blue) \
                "q" \
                (set_color brblack) \
                "]" \
                (set_color normal) \
                "?"
        )

        if not contains "$answer" (seq 1 $profiles_len) n q
            alert error "Invalid value: " $answer
            set -e answer
        end
    end

    switch $answer
        case q
            alert info "Quit without applying any changes." \n
            return
        case n
            alert info "Creating a new profile:" \n

            set user_email (text_input -t "What is your email address?")
            set user_name (text_input -t "What is your name?")
            set user_signingkey (
                text_input -t \
                    "What is your GPG signing key ID?" \
                    \n \
                    (set_color brblack) \
                    " (This will enable GPG commit signing!)"
            )

            echo
        case '*'
            set user_email $$profiles[$answer][1]
            set user_name $$profiles[$answer][2]
            set user_signingkey $$profiles[$answer][3]
    end

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

    if test $answer = n
        alert success "Created a new profile!" \n
    else
        alert success "Applied profile #$answer!" \n
    end
end

# Disables echoing of input characters.
function disable_input
    stty -echo 2>/dev/null
end

# Handles exits to print an error message if the exit code is not 0.
function handle_exit --on-event fish_exit
    if [ $status -ne 0 ]
        if [ -z "$err_msg" ]
            set err_msg "An unknown error has occured!"
        end

        echo -n -s \
            \n \
            (set_color -r red) \
            " X ERR " \
            (set_color normal) \
            (set_color red) \
            " " \
            $err_msg \
            (set_color normal) \
            \n\n
    end
end

disable_input

echo -s \
    (set_color blue) \
    "
     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/
    " \
    (set_color normal)

# Checks the provided options.
for opt in $argv
    switch $opt
        case -g --skip-git-user-config
            # Skips Git user configuration.
            set skip_git_user_config "true"
        case -v --verbose
            # Enables verbose output.
            set verbose "true"
        case -y --yes
            # Skips all prompts about whether they want to continue.
            set skip_prompts "true"
        case "*"
            # Exits with an error if the option is invalid.
            set err_msg "Invalid option " (set_color normal) $opt (set_color red) "!"
            exit 1
    end
end

# Warns the user about possible dangers and prompts them to answer whether they
# want to continue.
if [ "$skip_prompts" != "true" ]
    echo -s \
        \n \
        (set_color -r yellow) \
        " ! WARN " \
        (set_color normal) \
        (set_color yellow) \
        " This script could overwrite some of your existing configuration files! You may want to back them up, before you continue!" \
        (set_color normal)

    function prompt
        echo -n -s \
            \n\n \
            (set_color cyan) \
            "?" \
            (set_color normal) \
            " Do you want to continue? [" \
            (set_color green) \
            "y" \
            (set_color normal) \
            "/" \
            (set_color red) \
            "N" \
            (set_color normal) \
            "] "
    end

    read -p prompt answer
    disable_input

    # Exits with an error if they do not want to continue.
    if [ "$answer" != "y" ]
        set err_msg \
            "You need to answer with " \
            (set_color normal) \
            "y" \
            (set_color red) \
            " to continue!"
        exit 1
    else
        echo
    end
end

# Sets up Git user configuration.
if [ "$skip_git_user_config" != "true" ]
    # Sets the Windows Git credential helper as the default Git credential helper
    # if the current OS is a WSL2 instance, the Windows Git credential helper is
    # installed in its default directory and none is configured.
    # See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
    if [ -z (git config --file "$HOME/.git_userconfig" --get credential.helper) ] \
            && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" ]
        git config --file "$HOME/.git_userconfig" credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
    end

    # Prompts the user to set a default Git author email if none is configured.
    if [ -z (git config --file "$HOME/.git_userconfig" --get user.email) ]
        echo -s \n (set_color cyan) "?" (set_color normal) " What is your default Git author email?"

        function prompt
            echo -n -s (set_color green ) "❯ " (set_color normal)
        end

        read -p prompt user_email
        disable_input

        # Sets the user's default Git author email if the input is not empty.
        if [ -n "$user_email" ]
            git config --file "$HOME/.git_userconfig" user.email "$user_email"
        end

        echo
    end

    # Prompts the user to set a default Git author name if none is configured.
    if [ -z (git config --file "$HOME/.git_userconfig" --get user.name) ]
        echo -s \n (set_color cyan) "?" (set_color normal) " What is your default Git author name?"

        function prompt
            echo -n -s (set_color green ) "❯ " (set_color normal)
        end

        read -p prompt user_name
        disable_input

        # Sets the user's default Git author name if the input is not empty.
        if [ -n "$user_name" ]
            git config --file "$HOME/.git_userconfig" user.name "$user_name"
        end

        echo
    end
end

echo -s \n "Installing and configuring a few things:" \n

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Lists all modules in their correct order.
set modules \
    "fish" \
    "git" \
    "rust" \
    "pfetch" \
    "starship" \
    "exa" \
    "fnm"

# Installs all modules.
for module in $modules
    echo -s (set_color blue) "::" (set_color normal) " " $module "..."

    set install_script_path "$dir/$module/install.fish"
    set time_start (date "+%s")

    if [ "$verbose" != "true" ]
        fish "$install_script_path" >/dev/null 2>&1
    else
        fish "$install_script_path"
    end

    set time_end (date "+%s")
    set duration (math "$time_end - $time_start")

    switch $status
        case 0
            echo -n -s (set_color green) " ✓ done" (set_color normal)

            if [ $duration -ge 60 ]
                echo -s \
                    " took " \
                    (set_color yellow) \
                    (math "floor($duration / 60)") \
                    "m" \
                    (math "$duration % 60") \
                    "s" \
                    \n
            else if [ $duration -gt 0 ]
                echo -s " took " (set_color yellow) $duration "s" \n
            else
                echo \n
            end
        case 3
            echo -s (set_color yellow) " • skipped" (set_color normal) \n
        case "*"
            set err_msg \
                "The install script of " \
                (set_color normal) \
                $module \
                (set_color red) \
                " threw an error!"
            exit 1
    end
end

# Checks the current default shell and sets the appropriate completion message.
if [ (string match "*fish" "$SHELL") ]
    set completion_msg "Please restart your shell now!"
else
    set completion_msg \
        "You don't seem to be using fish as your default shell yet!" \
        \n\n \
        "Please follow this tutorial to switch to fish and restart your shell:" \
        \n\n \
        (set_color blue) \
        "    https://fishshell.com/docs/current/tutorial.html#switching-to-fish" \
        (set_color green)
end

echo -n -s \
    (set_color green) \
    "
                      __    __
 _______  __ _  ___  / /__ / /____
/ __/ _ \/  ' \/ _ \/ / -_) __/ -_)
\__/\___/_/_/_/ .__/_/\__/\__/\__/
             /_/
    " \
    \n\n \
    $completion_msg \
    \n\n \
    (set_color normal)

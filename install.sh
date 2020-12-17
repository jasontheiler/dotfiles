#!/bin/sh

# Gets terminal-dependent values of common text styling options.
bold="$(tput bold 2>/dev/null || printf "")"
reverse="$(tput rev 2>/dev/null || printf "")"
black="$(tput setaf 0 2>/dev/null || printf "")"
red="$(tput setaf 1 2>/dev/null || printf "")"
green="$(tput setaf 2 2>/dev/null || printf "")"
yellow="$(tput setaf 3 2>/dev/null || printf "")"
blue="$(tput setaf 4 2>/dev/null || printf "")"
magenta="$(tput setaf 5 2>/dev/null || printf "")"
cyan="$(tput setaf 6 2>/dev/null || printf "")"
white="$(tput setaf 7 2>/dev/null || printf "")"
brblack="$(tput setaf 8 2>/dev/null || printf "")"
brred="$(tput setaf 9 2>/dev/null || printf "")"
brgreen="$(tput setaf 10 2>/dev/null || printf "")"
bryellow="$(tput setaf 11 2>/dev/null || printf "")"
brblue="$(tput setaf 12 2>/dev/null || printf "")"
brmagenta="$(tput setaf 13 2>/dev/null || printf "")"
brcyan="$(tput setaf 14 2>/dev/null || printf "")"
brwhite="$(tput setaf 15 2>/dev/null || printf "")"
normal="$(tput sgr0 2>/dev/null || printf "")"

# Prints an error message.
print_error() {
    if [ ! -z "$error_msg" ]; then
        printf "\n${reverse}${red} X ERROR ${normal}${red} ${error_msg}${normal}\n\n"
    else
        printf "\n${reverse}${red} X ERROR ${normal}${red} An unknown error has occured!${normal}\n\n"
    fi
}

# Disables user inputs.
disable_input() {
    stty -echo 2>/dev/null
}

# Enables user inputs.
enable_input() {
    stty echo 2>/dev/null
}

# Disables user inputs and traps exits to enable them again and print an error
# message if the exit code is not 0.
trap '[ $? != 0 ] && print_error; enable_input' EXIT
disable_input

# Exits immediately if an error occurs.
set -e

printf "${blue}\

     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/

${normal}"

# Checks the provided flags.
for flag in $@; do
    case $flag in
        # Skips Git user configuration.
        -g | --skip-git-user-config)
        export skip_git_user_config=true
        shift
        ;;

        # Enables verbose output.
        -v | --verbose)
        export verbose=true
        shift
        ;;

        # Answers all questions about whether they want to continue with yes.
        -y | --yes)
        export yes=true
        shift
        ;;

        # Exits with an error if the flag is invalid.
        *)
        error_msg="Invalid flag ${normal}${flag}${red}!"
        exit 1
        ;;
    esac
done

# Warns the user about possible dangers and prompts them to answer whether they
# want to continue.
if [ "$yes" != true ]; then
    printf "\n${reverse}${yellow} ! WARNING ${normal}${yellow} This script could overwrite some of your existing configuration files! You may want to back them up, before you continue!${normal}\n\nDo you want to continue? [${green}y${normal}/${red}N${normal}] "

    enable_input
    read -r continue_answer
    disable_input

    # Exits with an error if they don't want to continue.
    if [ "$continue_answer" != "y" ]; then
        error_msg="You need to answer with ${normal}y${red} to continue!"
        exit 1
    else
        printf "\n"
    fi
fi

# Sets up Git user configuration.
if [ "$skip_git_user_config" != true ]; then
    # Sets the Windows Git credential helper as the default Git credential helper
    # if the current OS is a WSL2 instance, the Windows Git credential helper is
    # installed in its default directory and none is configured.
    # See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
    if [ -z "$(git config --file "${HOME}/.git_userconfig" --get credential.helper)" ] && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" ]; then
        git config --file "${HOME}/.git_userconfig" credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
    fi

    # Prompts the user to set a default Git author email if none is configured.
    if [ -z "$(git config --file "${HOME}/.git_userconfig" --get user.email)" ]; then
        printf "\n${magenta}?${normal} What is your default Git author email?\n${green}❯${normal} "

        enable_input
        read -r user_email
        disable_input

        # Sets the user's default Git author email if the input is not empty.
        [ ! -z "$user_email" ] && git config --file "${HOME}/.git_userconfig" user.email "$user_email"

        printf "\n"
    fi

    # Prompts the user to set a default Git author name if none is configured.
    if [ -z "$(git config --file "${HOME}/.git_userconfig" --get user.name)" ]; then
        printf "\n${magenta}?${normal} What is your default Git author name?\n${green}❯${normal} "

        enable_input
        read -r user_name
        disable_input

        # Sets the user's default Git author name if the input is not empty.
        [ ! -z "$user_name" ] && git config --file "${HOME}/.git_userconfig" user.name "$user_name"

        printf "\n"
    fi
fi

printf "\nInstalling a few things:\n\n"

# Determines the absolute path to the current directory.
dir="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Runs all install scripts.
while read -r install_script; do
    # Prints the install script's directory name.
    install_script_path=${install_script#*"${dir}/"}
    install_script_dir=${install_script_path%"/install.sh"*}
    printf "${cyan}❯${normal} ${install_script_dir}...\n"

    # Runs the install script and prints a status message.
    if
        if [ "$verbose" != true ]; then
        sh -c "$install_script" >/dev/null 2>&1
        else
        sh -c "$install_script"
        fi
    then
        printf "${green}✓ done${normal}\n\n"
    else
        error_msg="The install script of ${normal}${install_script_dir}${red} threw an error!"
        exit 1
    fi
done << EOT
    $(find "$dir" -mindepth 2 -name "install.sh" -type f)
EOT

# Checks the default shell and sets the appropriate completion message.
if [[ "$SHELL" =~ ^.*fish$ ]]; then
    completion_msg="Please restart your shell now!"
else
    completion_msg="You don't seem to be using fish yet!

Please follow this tutorial to switch to fish and restart your shell:

    ${blue}https://fishshell.com/docs/current/tutorial.html#switching-to-fish"
fi

printf "${green}\
                      __    __
 _______  __ _  ___  / /__ / /____
/ __/ _ \/  ' \/ _ \/ / -_) __/ -_)
\__/\___/_/_/_/ .__/_/\__/\__/\__/
             /_/


${completion_msg}

${normal}"

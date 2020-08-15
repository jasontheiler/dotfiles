#!/bin/sh

# Disables user inputs and traps exits to enable them again.
trap "stty echo" EXIT
stty -echo

# Prints an error message.
print_error() {
  if [ ! -z "$ERROR_MSG" ]; then
    printf "\n\e[31mX ERROR: $ERROR_MSG\n\n"
  else
    printf "\n\e[31mX ERROR: An unknown error has occured!\n\n"
  fi
}

# Traps exits and prints an error message if the error code is not 0.
trap 'if [ $? != 0 ]; then print_error; fi' EXIT

# Exits immediately if an error occurs.
set -e

printf "\e[34m\

     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/

\e[00m"

# Prints an error message and exits the script if it is run as a superuser.
if [ "$(id -u)" = 0 ]; then
  ERROR_MSG="Don't run this script as a superuser!"
  exit 1
fi

# Checks the provided flags.
for flag in "$@"; do
  case $flag in
    # Enables verbose output.
    -v | --verbose)
    VERBOSE=true
    shift
    ;;

    # Exits with an error if the flag is invalid.
    *)
    ERROR_MSG="Invalid flag $flag!"
    exit 1
    ;;
  esac
done

# Warns the user about possible dangers and prompts them to answer whether they
# want to continue.
printf "\n\e[33m! WARNING: This script could overwrite some of your existing configuration files!\e[00m\n\n"
printf "Do you want to continue? [\e[32my\e[00m/\e[31mN\e[00m] "
stty echo
read -r CONTINUE_ANSWER
stty -echo

# Exits with an error if they don't want to continue.
if [ "$CONTINUE_ANSWER" != "y" ]; then
  ERROR_MSG="You need to answer with \e[00my\e[31m to continue!"
  exit 1
else
  printf "\n\n"
fi

# Sets the Windows Git credential helper as the default Git credential helper
# if the current OS is a WSL2 instance and none is configured.
# See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
if [ -z "$(git config --global --get credential.helper)" ] && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" ]; then
  git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
fi

# Prompts the user to set a default Git author email if none is configured.
if [ -z "$(git config --global --get user.email)" ]; then
  printf "\e[35m? \e[00mWhat is your default Git author email?\n\e[32m❯ \e[00m"
  stty echo
  read -r USER_EMAIL
  stty -echo

  # Sets the user's default Git author email if the input is not empty.
  if [ ! -z "$USER_EMAIL" ]; then
    git config --global user.email "$USER_EMAIL"
  fi

  printf "\n\n"
fi

# Prompts the user to set a default Git author name if none is configured.
if [ -z "$(git config --global --get user.name)" ]; then
  printf "\e[35m? \e[00mWhat is your default Git author name?\n\e[32m❯ \e[00m"
  stty echo
  read -r USER_NAME
  stty -echo

  # Sets the user's default Git author name if the input is not empty.
  if [ ! -z "$USER_NAME" ]; then
    git config --global user.name "$USER_NAME"
  fi

  printf "\n\n"
fi

printf "Installing a few things:\n\n"

# Exports the absolute path to this repository.
export DOTFILES="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Runs all install scripts in sequence.
while read -r install_script; do
  # Prints the install script's directory name.
  install_script_path=${install_script#*"$DOTFILES/"}
  install_script_dir=${install_script_path%"/install.sh"*}
  printf "\e[36m❯ \e[00m$install_script_dir...\n"

  # Runs the install script and prints a status message.
  if
    if [ "$VERBOSE" != "true" ]; then
      sh -c "$install_script" >/dev/null 2>&1
    else
      sh -c "$install_script"
    fi
  then
    printf "\e[32m✓ done\e[00m\n\n"
  else
    ERROR_MSG="The install script of $install_script_dir threw an error!"
    exit 1
  fi
done << EOT
  $(find "$DOTFILES" -mindepth 2 -name "install.sh" -type f)
EOT

# Changes the default shell of the current user to ZSH.
sudo chsh -s $(which zsh) $(whoami)

printf "\e[32m\
                      __    __
 _______  __ _  ___  / /__ / /____
/ __/ _ \/  ' \/ _ \/ / -_) __/ -_)
\__/\___/_/_/_/ .__/_/\__/\__/\__/
             /_/


You should now follow one of these steps:

  \e[00m• \e[32mIf you already use ZSH, run \e[36msource \e[35m~\e[00m/.zshrc\e[32m

  \e[00m• \e[32mIf you don't use ZSH yet, run \e[00mzsh\e[32m

  \e[00m• \e[32mAlternatively, you can just restart your shell!

\e[00m"

#!/bin/sh

# Options:
#
#   -p, --portable
#     Enables portable installation.
#
#   -v, --verbose
#     Enables verbose output.
#

# Disables user inputs and traps exits to enable them again.
trap 'stty echo' EXIT
stty -echo

# Gets terminal-dependent values of common text styling options.
BOLD="$(tput bold 2>/dev/null || printf "")"
REVERSE="$(tput rev 2>/dev/null || printf "")"
BLACK="$(tput setaf 0 2>/dev/null || printf "")"
RED="$(tput setaf 1 2>/dev/null || printf "")"
GREEN="$(tput setaf 2 2>/dev/null || printf "")"
YELLOW="$(tput setaf 3 2>/dev/null || printf "")"
BLUE="$(tput setaf 4 2>/dev/null || printf "")"
PURPLE="$(tput setaf 5 2>/dev/null || printf "")"
CYAN="$(tput setaf 6 2>/dev/null || printf "")"
RESET="$(tput sgr0 2>/dev/null || printf "")"

# Prints an error message.
print_error() {
  if [ ! -z "$ERROR_MSG" ]; then
    printf "\n${REVERSE}${RED} X ERROR: ${RESET}${RED} ${ERROR_MSG}${RESET}\n\n"
  else
    printf "\n${REVERSE}${RED} X ERROR: ${RESET}${RED} An unknown error has occured!${RESET}\n\n"
  fi
}

# Traps exits and prints an error message if the error code is not 0.
trap '[ $? != 0 ] && print_error' EXIT

# Exits immediately if an error occurs.
set -e

printf "${BLUE}\

     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/

${RESET}"

# Checks the provided flags.
for flag in $@; do
  case $flag in
    # Enables portable installation.
    -p | --portable)
    export PORTABLE="true"
    shift
    ;;

    # Enables verbose output.
    -v | --verbose)
    export VERBOSE="true"
    shift
    ;;

    # Exits with an error if the flag is invalid.
    *)
    ERROR_MSG="Invalid flag ${RESET}${flag}${RED}!"
    exit 1
    ;;
  esac
done

# Warns the user about possible dangers and prompts them to answer whether they
# want to continue.
printf "\n${REVERSE}${YELLOW} ! WARNING: ${RESET}${YELLOW} This script could overwrite some of your existing configuration files!${RESET}\n\n"
printf "Do you want to continue? [${GREEN}y${RESET}/${RED}N${RESET}] "
stty echo
read -r CONTINUE_ANSWER
stty -echo

# Exits with an error if they don't want to continue.
if [ "$CONTINUE_ANSWER" != "y" ]; then
  ERROR_MSG="You need to answer with ${RESET}y${RED} to continue!"
  exit 1
else
  printf "\n\n"
fi

# Sets the Windows Git credential helper as the default Git credential helper
# if the current OS is a WSL2 instance and none is configured.
# See: https://docs.microsoft.com/windows/wsl/tutorials/wsl-git
if [ -z "$(git config --file "${HOME}/.git_userconfig" --get credential.helper)" ] && [ -f "/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" ]; then
  git config --file "${HOME}/.git_userconfig" credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
fi

# Prompts the user to set a default Git author email if none is configured.
if [ -z "$(git config --file "${HOME}/.git_userconfig" --get user.email)" ]; then
  printf "${PURPLE}?${RESET} What is your default Git author email?\n${GREEN}❯${RESET} "
  stty echo
  read -r USER_EMAIL
  stty -echo

  # Sets the user's default Git author email if the input is not empty.
  [ ! -z "$USER_EMAIL" ] && git config --file "${HOME}/.git_userconfig" user.email "$USER_EMAIL"

  printf "\n\n"
fi

# Prompts the user to set a default Git author name if none is configured.
if [ -z "$(git config --file "${HOME}/.git_userconfig" --get user.name)" ]; then
  printf "${PURPLE}?${RESET} What is your default Git author name?\n${GREEN}❯${RESET} "
  stty echo
  read -r USER_NAME
  stty -echo

  # Sets the user's default Git author name if the input is not empty.
  [ ! -z "$USER_NAME" ] && git config --file "${HOME}/.git_userconfig" user.name "$USER_NAME"

  printf "\n\n"
fi

printf "Installing a few things:\n\n"

# Exports the absolute path to this repository.
export DOTFILES="$( cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P )"

# Runs all install scripts.
while read -r install_script; do
  # Prints the install script's directory name.
  install_script_path=${install_script#*"${DOTFILES}/"}
  install_script_dir=${install_script_path%"/install.sh"*}
  printf "${CYAN}❯${RESET} ${install_script_dir}...\n"

  # Runs the install script and prints a status message.
  if
    if [ "$VERBOSE" != "true" ]; then
      sh -c "$install_script" >/dev/null 2>&1
    else
      sh -c "$install_script"
    fi
  then
    printf "${GREEN}✓ done${RESET}\n\n"
  else
    ERROR_MSG="The install script of ${RESET}${install_script_dir}${RED} threw an error!"
    exit 1
  fi
done << EOT
  $(find "$DOTFILES" -mindepth 2 -name "install.sh" -type f)
EOT

printf "${GREEN}\
                      __    __
 _______  __ _  ___  / /__ / /____
/ __/ _ \/  ' \/ _ \/ / -_) __/ -_)
\__/\___/_/_/_/ .__/_/\__/\__/\__/
             /_/


You should now follow one of these steps:

  ${RESET}•${GREEN} If you already use ZSH, run ${CYAN}source ${PURPLE}~${RESET}/.zshrc${GREEN} to reload your ZSH configuration.

  ${RESET}•${GREEN} If you don't use ZSH yet...

    ${RESET}1)${GREEN} Run ${RESET}chsh -s ${YELLOW}\"\$(which zsh)\"${GREEN} to set ZSH as your default shell.

    ${RESET}2)${GREEN} Restart your shell or run ${RESET}zsh${GREEN} to start ZSH immediately.

${RESET}"

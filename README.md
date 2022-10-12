<div align="center">

# dotfiles

**My personal configuration files for fish, Neovim and more!**

<br />

</div>

## Installation

### Prerequisites

You need to make sure that you have access to the following things:

- [`git`](https://git-scm.com/): To clone and manage this repository.
- [`stow`](https://www.gnu.org/software/stow/): To manage the dotfiles.
- [`fish`](https://fishshell.com/): To use the dotfiles.

### How to

Follow these steps to install the dotfiles:

1. Clone the repository into your home directory:

   ```sh
   # Using HTTPS
   git clone https://github.com/jasontheiler/dotfiles.git ~/.dotfiles/

   # Using SSH
   git clone git@github.com:jasontheiler/dotfiles.git ~/.dotfiles/
   ```

2. Stow the dotfiles in your home directory from inside the local repository:

   ```sh
   # Stows all packages.
   stow */

   # Stows select packages.
   stow fish/ git/

   # Unstows select packages.
   stow -D starship/ exa/ fnm/
   ```

3. Restart your shell.

## License

[GPL-3.0 License](/LICENSE) © 2021-PRESENT [Jason Theiler](https://github.com/jasontheiler)

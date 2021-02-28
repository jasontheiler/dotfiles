<div align="center">

# dotfiles

**My personal Linux configuration files for fish and more!**

[![powered by fish](https://img.shields.io/badge/powered%20by-fish-4aae47.svg?style=flat-square)](https://fishshell.com/)
[![powered by Rust](https://img.shields.io/badge/powered%20by-Rust-f74c00.svg?style=flat-square)](https://www.rust-lang.org/)

</div>

![dotfiles preview](/images/preview.png)

> Configuration used in the preview:
>
> - Terminal emulator: [Windows Terminal](https://github.com/microsoft/terminal)
> - Color scheme: [Dracula PRO](https://draculatheme.com/pro)
> - Font: [Cascadia Code PL](https://github.com/microsoft/cascadia-code)

## Installation

### Prerequisites & Dependencies

You need to make sure that you have access to all these things:

- [`git`](https://git-scm.com/): To clone this repository.
- [`fish`](https://fishshell.com/) (3.0 or later): To actually run the install
  scripts and utilize the dotfiles.
- [`curl`](https://curl.se/): To download files.
- [`gcc`](https://gcc.gnu.org/): To install
  [Rust](https://www.rust-lang.org/)-based tools via
  [Cargo](https://doc.rust-lang.org/cargo/).

### How to

Follow these steps to install the dotfiles:

```sh
# Clone the repository to your home directory or any other directory.
git clone https://github.com/jasontheiler/dotfiles.git ~/.dotfiles

# Run the install script in the root of the local repository.
fish ~/.dotfiles/install.fish

#
# Options:
#
#     -g, --skip-git-user-config
#         Skips Git user configuration.
#
#     -v, --verbose
#         Enables verbose output.
#
#     -y, --yes
#         # Skips all prompts about whether they want to continue.
#
```

## License

[MIT License](/LICENSE)

Copyright © 2021 [Jason Theiler](https://github.com/jasontheiler)

<div align="center">

# dotfiles

**My personal Linux configuration files for fish and more!**

[![powered by pfetch](https://img.shields.io/badge/powered%20by-pfetch-a17777.svg?style=flat-square)](https://github.com/dylanaraps/pfetch)
[![powered by Starship](https://img.shields.io/badge/powered%20by-Starship-ff33b8.svg?style=flat-square)](https://starship.rs/)
[![powered by exa](https://img.shields.io/badge/powered%20by-exa-813234.svg?style=flat-square)](https://the.exa.website/)
[![powered by Fast Node Manager](https://img.shields.io/badge/powered%20by-Fast%20Node%20Manager-689f63.svg?style=flat-square)](https://fnm.vercel.app/)

</div>

![dotfiles preview](/images/preview.png)

> Configuration used in the preview:
>
> - Terminal emulator: [Windows Terminal](https://github.com/microsoft/terminal)
> - Color scheme: [Dracula PRO - Van Helsing](https://draculatheme.com/pro)
> - Font: [Cascadia Code PL](https://github.com/microsoft/cascadia-code)

## Installation

### Prerequisites & Dependencies

You need to make sure that you have access to all these things:

- [`git`](https://git-scm.com/): To clone this and other repositories.
- `curl`: To download scripts and archives.
- `tar`: To extract downloaded archives.
- `unzip`: To extract downloaded archives.
- `bash`: To run some downloaded scripts.
- [`fish`](https://fishshell.com/) (3.0 or later): To actually utilize the dotfiles.

### How to

Follow these steps to install the dotfiles:

```bash
# Clone the repository to your home directory or any other directory.
git clone https://github.com/jasontheiler/dotfiles.git ~/.dotfiles

# Run the install script in the root of the local repository.
sh ~/.dotfiles/install.sh

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
#         Answers all questions about whether you want to continue with yes.
#
```

## License

[MIT License](/LICENSE)

Copyright © 2020 [Jason Theiler](https://github.com/jasontheiler)

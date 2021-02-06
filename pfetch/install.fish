# Creates a ~/.local/bin directory if none exists.
mkdir -p "$HOME/.local/bin"

# Installs pfetch.
# See: https://github.com/dylanaraps/pfetch
curl -fsSL https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch -o "$HOME/.local/bin/pfetch"
chmod 755 "$HOME/.local/bin/pfetch"

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "$HOME/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "$dir/pfetch.fish" "$HOME/.config/fish/conf.d"

# Creates a ~/.config/fish/functions directory if none exists.
mkdir -p "$HOME/.config/fish/functions"

# Creates a symbolic link to the fish configuration file.
ln -sf "$dir/fish_greeting.fish" "$HOME/.config/fish/functions"

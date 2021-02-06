# Creates a ~/.local/bin directory if none exists.
mkdir -p "$HOME/.local/bin"

# Installs Starship.
# See: https://starship.rs/
curl -fsSL https://starship.rs/install.sh | bash -s -- -b "$HOME/.local/bin" -y

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config directory if none exists.
mkdir -p "$HOME/.config"

# Creates a symbolic link to the Starship configuration file.
ln -sf "$dir/starship.toml" "$HOME/.config"

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "$HOME/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "$dir/starship.fish" "$HOME/.config/fish/conf.d"

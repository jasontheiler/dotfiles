# Installs bat.
# See: https://github.com/sharkdp/bat
cargo install bat

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config/bat directory if none exists.
mkdir -p "$HOME/.config/bat"

# Creates a symbolic link to the bat configuration file.
ln -sf "$dir/config" "$HOME/.config/bat"

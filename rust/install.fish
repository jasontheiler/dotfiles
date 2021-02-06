# Installs Rust using rustup.
# See: https://www.rust-lang.org/
curl -fsSL https://sh.rustup.rs | sh -s -- -y --no-modify-path

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "$HOME/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "$dir/rust.fish" "$HOME/.config/fish/conf.d"

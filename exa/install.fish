# Traps exits to clean up leftover files and directories.
# trap 'rm -rf /tmp/exa.zip /tmp/exa' EXIT
set zip_path /tmp/exa.zip
set dir_path /tmp/exa

function handle_exit --on-event fish_exit
    rm -rf "$zip_path" "$dir_path"
end

# Creates a temporary /tmp/exa directory if none exists.
mkdir -p "$dir_path"

# Creates a ~/.local/bin directory if none exists.
mkdir -p "$HOME/.local/bin"

# Installs exa.
# See: https://the.exa.website/
curl -fsSL (curl -fsSL https://api.github.com/repos/ogham/exa/releases/latest | grep "browser_download_url.*exa-linux-x86_64.*.zip" | cut -d ":" -f 2,3 | tr -d \" | tr -d " ") -o "$zip_path"
unzip -u "$zip_path" -d "$dir_path"
mv -f "$dir_path/exa-linux-x86_64" "$HOME/.local/bin/exa"

# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "$HOME/.config/fish/conf.d"

# Creates a symbolic link to the fish configuration file.
ln -sf "$dir/exa.fish" "$HOME/.config/fish/conf.d"

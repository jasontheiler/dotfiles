# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a ~/.config/fish/conf.d directory if none exists.
mkdir -p "$HOME/.config/fish/conf.d"

# Determines the absolute paths to all configuration files.
set config_file_paths (find "$dir/conf.d" -maxdepth 1 -name "*.fish" -type f)

# Creates symbolic links to all configuration files.
for config_file_path in $config_file_paths
    ln -sf "$config_file_path" "$HOME/.config/fish/conf.d"
end

# Creates a ~/.config/fish/functions directory if none exists.
mkdir -p "$HOME/.config/fish/functions"

# Determines the absolute paths to all function files.
set function_file_paths (find "$dir/functions" -maxdepth 1 -name "*.fish" -type f)

# Creates symbolic links to all function files.
for function_file_path in $function_file_paths
    ln -sf "$function_file_path" "$HOME/.config/fish/functions"
end

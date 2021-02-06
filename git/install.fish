# Determines the absolute path to the directory this script is located in.
set dir (string split -r -m 1 "/" (status filename))[1]

# Creates a symbolic link to the Git configuration file.
ln -sf "$dir/gitconfig" "$HOME/.gitconfig"

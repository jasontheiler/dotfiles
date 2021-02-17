# Appends ~/.local/bin directory to the user paths.
set -a fish_user_paths ~/.local/bin

# Loads Starship.
# See: https://starship.rs/
starship init fish | source

# Loads Starship completions.
starship completions fish | source

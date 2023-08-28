# Appends directories to the user paths.
set -a fish_user_paths \
    ~/.local/bin/ \
    ~/.cargo/bin/

if set -q WSL_DISTRO_NAME
    set -a fish_user_paths "/mnt/c/Program Files/win32yank/"
end

set -a fish_user_paths \
    $HOME/.local/bin/ \
    $HOME/.cargo/bin/

if set -q WSL_DISTRO_NAME
    set -a fish_user_paths "/mnt/c/Program Files/win32yank/"
end

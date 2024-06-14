set -a fish_user_paths \
    $HOME/.bun/bin/ \
    $HOME/.cargo/bin/ \
    $HOME/.go/bin/ \
    $HOME/.local/bin/

if set -q WSL_DISTRO_NAME
    set -a fish_user_paths "/mnt/c/Program Files/win32yank/"
end

set -a fish_user_paths \
    $CARGO_HOME/bin \
    $GOPATH/bin \
    $HOME/.bun/bin \
    $HOME/.krew/bin \
    $HOME/.local/bin

if set -q WSL_DISTRO_NAME
    set -a fish_user_paths "/mnt/c/Program Files/win32yank"
end

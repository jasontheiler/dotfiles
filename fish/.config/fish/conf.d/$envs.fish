set -l this_file_path (path resolve (status current-filename))
set -x DOTFILES_DIR (string replace /fish/.config/fish/conf.d/\$envs.fish "" $this_file_path)

set -x PAGER "less -RS"

set -x CARGO_HOME $HOME/.cargo
set -x GOPATH $HOME/.go

set -a fish_user_paths \
    $CARGO_HOME/bin \
    $GOPATH/bin \
    $HOME/.bun/bin \
    $HOME/.deno/bin \
    $HOME/.krew/bin \
    $HOME/.local/bin

if set -q WSL_DISTRO_NAME
    set -x BROWSER explorer.exe
    set -a fish_user_paths "/mnt/c/Program Files/win32yank"
end

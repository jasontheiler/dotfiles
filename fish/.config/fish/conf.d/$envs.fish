set -l this_file_path (path resolve (status current-filename))
set -x DOTFILES_DIR (string replace /fish/.config/fish/conf.d/\$envs.fish "" $this_file_path)

if set -q WSL_DISTRO_NAME
    set -x BROWSER explorer.exe
end

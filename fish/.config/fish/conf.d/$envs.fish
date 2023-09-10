set -l THIS_FILE_PATH_REL .config/fish/conf.d/\$envs.fish
set -l this_file_path (path resolve $HOME/$THIS_FILE_PATH_REL)
set -l dotfiles_dir_path (string replace /fish/$THIS_FILE_PATH_REL "" $this_file_path)

set -x DOTFILES_DIR $dotfiles_dir_path

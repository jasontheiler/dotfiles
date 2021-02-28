# Appends ~/.local/bin directory to the user paths.
set -a fish_user_paths ~/.local/bin

# Sets information and alignment for pfetch.
# See: https://github.com/dylanaraps/pfetch#configuration
set -x PF_INFO ascii title os kernel uptime pkgs memory wm shell editor palette
set -x PF_ALIGN 8

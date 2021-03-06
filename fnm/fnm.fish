# Appends ~/.cargo/bin directory to the user paths.
set -a fish_user_paths ~/.cargo/bin

# Loads Fast Node Manager environment.
# See: https://fnm.vercel.app/
fnm env | source

# Loads Fast Node Manager completions.
# See: https://fnm.vercel.app/#completions
fnm completions --shell fish | source

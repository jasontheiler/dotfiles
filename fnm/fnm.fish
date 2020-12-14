# Prepends ~/.fnm directory to PATH.
set PATH ~/.fnm $PATH

# Loads Fast Node Manager.
# See: https://fnm.vercel.app/
fnm env | source

# Loads Fast Node Manager completions.
# See: https://fnm.vercel.app/#completions
fnm completions --shell fish | source

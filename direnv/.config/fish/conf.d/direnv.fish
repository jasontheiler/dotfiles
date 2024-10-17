# See: https://direnv.net/
direnv hook fish | source

# See: https://github.com/direnv/direnv/wiki/Quiet-or-Silence-direnv
set -x DIRENV_LOG_FORMAT

# See: https://github.com/direnv/direnv/wiki/Tmux
if command -q tmux
    alias tmux "direnv exec / tmux"
end

# Attaches to a default tmux session or creates a new one, if one doesn't already exist.
if not set -q TMUX
    exec tmux new-session -As default -c $HOME
end

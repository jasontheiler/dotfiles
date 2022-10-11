# Attaches to the default tmux session or creates a new one.
if not set -q TMUX
    if tmux has -t default 2>/dev/null
        # exec tmux attach -t default
    else
        # exec tmux new -s default
    end
end

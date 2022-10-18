# Attaches to a default tmux session or creates a new one, if one doesn't already exist.
if not set -q TMUX
    if not tmux has-session -t default 2>/dev/null
        tmux new-session -d -s default -c $HOME 2>/dev/null
    end

    if test $status -eq 0
        exec tmux attach-session -t default
    end
end

# Creates a new tmux session with the current working directory as its name and attaches to it.
function tmux_create_session \
    -d "Creates a new tmux session with the current working directory as its name and attaches to it."
    set -l session_name (tmux new-session -dP -s (string replace $HOME "~" $PWD) -c $PWD 2>/dev/null)

    if test $status -ne 0
        alert error "Session does already exist"
    end

    if set -q TMUX
        tmux switch-client -t $session_name
    else
        tmux attach-session -t $session_name
    end
end

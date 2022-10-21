function tmux_create_session
    if not test -d $argv[1]
        alert error "Directory does not exist: " `$argv[1]`
        return 1
    end

    set -l working_dir (realpath $argv[1])

    if test $working_dir = /
        alert error "The root directory must not be used!"
        return 1
    end

    set -l session_paths (tmux list-sessions -F "#{session_path}" 2>/dev/null)

    if test (count $session_paths) -eq 0
        tmux new-session -s $working_dir_segs[-1] -c $working_dir
        return
    else if contains $working_dir $session_paths
        alert error "A session with this working directory already exists!"
        return 1
    end

    set -l working_dir_segs (string split / (string trim -c / $working_dir))
    set -l session_names (tmux list-sessions -F "#{session_name}")

    tmux new-session -d -s $working_dir_segs[-1] -c $working_dir

    if set -q TMUX
        tmux switch-client -t $working_dir_segs[-1]
    else
        tmux attach-session -t $working_dir_segs[-1]
    end
end

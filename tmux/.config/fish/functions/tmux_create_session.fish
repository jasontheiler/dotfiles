function tmux_create_session
    set -l working_dir $argv[1]

    if test -z $working_dir
        set working_dir (pwd)
    end

    if not test -d $working_dir
        alert error "Directory does not exist: " `$working_dir`
        return 1
    end

    set working_dir (realpath $working_dir)
    set -l session_paths (tmux list-sessions -F "#{session_path}" 2>/dev/null)

    if contains $working_dir $session_paths
        alert error "A session with this working directory already exists!"
        return 1
    end

    set -l session_id (tmux new-session -dP -c $working_dir -x - -y -)

    if test $status -gt 0
        return $status
    end

    tmux (if set -q TMUX; echo switch-client; else; echo attach-session; end) -t $session_id\; \
        send-keys nvim Enter\; \
        # split-window -dv -c $working_dir\; \
        # select-layout main-vertical\; \
        new-window -dc $working_dir
end

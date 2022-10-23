function tmux_create_session
    if not test -d $argv[1]
        alert error "Directory does not exist: " `$argv[1]`
        return 1
    end

    set -l working_dir (realpath $argv[1])
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
        split-window -dh -c $working_dir -e GREETING=false\; \
        select-layout main-vertical\; \
        new-window -dc $working_dir
end

function tmux_session_create
    argparse d/detached -- $argv
    or return 1

    set paths $argv
    if test -z "$paths"
        set paths $PWD
    end

    for path in $paths
        if not test -d $path
            echo "error: \"$path\" is not a directory" >&2
            return 1
        end

        set dir (path resolve -- $path)

        set -e session_id
        for line in (tmux list-sessions -F "#{session_id} #{session_name} #{session_path}" 2>/dev/null)
            set fields (string split --max=2 " " -- $line)
            string match --quiet "popup_*" -- $fields[2]
            and continue
            test (path resolve -- $fields[3]) = $dir
            or continue
            set session_id $fields[1]
            break
        end

        if test -z "$session_id"
            set session_id (tmux new-session -dc $dir -PF '#{session_id}'); or return 1
            test -z "$created_session_id"
            and set created_session_id $session_id # Prefer the first newly created session...
        else if test -z "$existing_session_id"
            set existing_session_id $session_id # ...or fall back to the first pre-existing one.
        end
    end

    set target_session_id $created_session_id
    test -z "$target_session_id"
    and set target_session_id $existing_session_id

    if set -q _flag_detached; or test -z "$target_session_id"
        return 0
    end

    if set -q TMUX
        set client_name (tmux display-message -p "#{?#{m:popup_*,#{session_name}},#{s|^popup_[a-z]+_||:session_name},#{client_name}}")
        tmux switch-client -t $target_session_id -c $client_name
    else
        tmux attach-session -t $target_session_id
    end
end

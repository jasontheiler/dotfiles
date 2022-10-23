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

    set -l working_dir_segs (string split / (string trim -c / $working_dir))
    set -l session_names (tmux list-sessions -F "#{session_name}" 2>/dev/null) \
        projects/microservices/quizwall
    set -l prev_session_names

    for i in (seq 1 (count $working_dir_segs))
        set -l i (math $i \* -1)
        set -l proposed_name (string join / $working_dir_segs[$i..-1])
        set -l matched_session_names

        for session_name in $session_names
            set -l session_name_segs (string split / (string trim -c / $session_name))

            if test (string join / $session_name_segs[$i..-1]) = $proposed_name
                set -a matched_session_names $session_name
            end
        end

        if test (count $matched_session_names) -eq 0
            if test (count $prev_session_names) -eq 1
                set -l similar_session_name $prev_session_names[1]
                set -l similar_session_path \
                    (tmux display-message -t $similar_session_name -p "#{session_path}")
                set -l similar_session_path_segs \
                    (string split / (string trim -c / $similar_session_path))

                if test (count $similar_session_path_segs) -ge $i
                    for j in (seq $i (math max (count $working_dir_segs) (count $similar_session_path_segs)))
                        set -l j (math $j \* -1)
                        set proposed_name (string join / $working_dir_segs[$j..-1])
                        set similar_session_proposed_name \
                            (string join / $similar_session_path_segs[$j..-1])

                        if test $proposed_name != $similar_session_proposed_name
                            break
                        end
                    end
                else
                    alert warning \
                        "The name of the similar session " \
                        `$similar_session_name` \
                        " is already as specific as its working directory " \
                        `$similar_session_path` \
                        " allows."
                end
            end

            tmux new-session -d -s $proposed_name -c $working_dir

            if set -q TMUX
                tmux switch-client -t $proposed_name
            else
                tmux attach-session -t $proposed_name
            end

            return
        end

        set prev_session_names $session_names
        set session_names $matched_session_names
    end

    alert error "Failed to find a unique session name!"
end

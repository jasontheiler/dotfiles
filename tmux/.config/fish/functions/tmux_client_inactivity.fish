function tmux_client_inactivity
    if not set -q TMUX
        return 1
    end

    set tmux_tmp_dir (dirname (tmux display-message -p "#{socket_path}"))
    set client_name (tmux display-message -p "#{client_name}")
    set last_activity_file $tmux_tmp_dir/last-activity(string replace -a / - $client_name)

    set client_activity (tmux display-message -p "#{client_activity}")
    set last_activity (cat $last_activity_file 2>/dev/null || echo 0)

    if test $client_activity -gt $last_activity
        set last_activity $client_activity
    end

    if test (math (date +%s) - $last_activity) -gt 600
        tmux display-popup -C
        tmux display-popup -EB -w 100% -h 100% pipes
        date +%s >$last_activity_file
    end
end

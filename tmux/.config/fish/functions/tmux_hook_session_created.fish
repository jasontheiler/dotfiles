function tmux_hook_session_created
    set WINDOW_FORMAT "#{window_id}"
    set PANE_FORMAT "#{pane_id}"

    set session_name $argv[1]
    set session \$$session_name

    set window_1 (tmux display-message -t $session -p $WINDOW_FORMAT)
    tmux select-layout -t $window_1 main-vertical

    set pane_1_1 (tmux display-message -t $window_1 -p $PANE_FORMAT)
    tmux send-keys -t $pane_1_1 " nvim" Enter

    set window_2 (tmux new-window -at $window_1 -dPF $WINDOW_FORMAT)
end

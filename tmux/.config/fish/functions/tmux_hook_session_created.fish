function tmux_hook_session_created
    set window_1 (tmux display-message -p "#{window_id}")
    tmux select-layout -t $window_1 main-vertical

    set pane_1_1 (tmux display-message -t $window_1 -p "#{pane_id}")
    tmux send-keys -t $pane_1_1 " nvim" Enter

    set window_2 (tmux new-window -dPF "#{window_id}")
end

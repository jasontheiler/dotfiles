function tmux_popup_scratch
    set client_name (tmux display-message -p "#{client_name}")
    tmux new-session -A \
        -c $HOME \
        -e TMUXION_TARGET_CLIENT=$client_name \
        -s scratch_$client_name
end

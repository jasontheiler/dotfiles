function tmux_popup_scratch
    if not set -q TMUX
        return 1
    end

    set client_name (tmux display-message -p "#{client_name}")
    tmux new-session -A \
        -s popup_scratch_$client_name \
        -c $HOME \
        -e TMUXION_TARGET_CLIENT=$client_name
end

function tmux_popup_scratch
    set -q TMUX
    or return 1

    set client_name (tmux display-message -p "#{client_name}")
    tmux new-session -A -s popup_scratch_$client_name -c $HOME
end

function tmux_popup_select
    set -q TMUX
    or return 1

    set client_name (tmux display-message -p "#{?#{m:popup_*,#{session_name}},#{s|^popup_[a-z]+_||:session_name},#{client_name}}")
    tmux list-sessions -F "#{session_id} #{session_name} #{s|$HOME|~|:session_path}" \
        | grep -v popup_ \
        | fzf --height=16 --with-nth=3 \
        | cut -d" " -f1 \
        | xargs tmux switch-client -c $client_name -t
end

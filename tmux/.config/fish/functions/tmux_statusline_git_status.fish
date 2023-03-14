function tmux_statusline_git_status
    set -l tmux_session_path (tmux display-message -p "#{session_path}")
    set -l starship_output (starship module -p "$tmux_session_path" git_status)
    echo -s " " (string replace -ar "\[[\d;]+m" "" "$starship_output")
end

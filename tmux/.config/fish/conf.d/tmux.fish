# Adds tmux abbreviations.
abbr -a txac tmux choose-session -ZNF \"#{session_path}\" \&\& tmux attach-session
abbr -a txcd cd \(tmux display-message -p \"#{session_path}\"\)

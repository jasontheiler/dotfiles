abbr -a txa " "tmux_session_create -d \$DOTFILES_DIR \&\& tmux a
abbr -a txc tmux_session_create
abbr -a txk tmux kill-session
abbr -a txcd cd \(tmux display -p \"#{session_path}\"\)

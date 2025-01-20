abbr -a txa " "tmuxion c -d \$DOTFILES_DIR \&\& tmux a
abbr -a txc tmuxion c
abbr -a txk tmux kill-session
abbr -a txcd cd \(tmux display -p \"#{session_path}\"\)

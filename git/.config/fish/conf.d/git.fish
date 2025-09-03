set -x GIT_TEMPLATE_DIR $DOTFILES_DIR/git/template

abbr -a gc git commit
abbr -a gcm --set-cursor="<MESSAGE>" git commit -m \""<MESSAGE>"\"
abbr -a gp git push
abbr -a gu git reset --mixed @~
abbr -a gri --set-cursor="<COUNT>" git rebase -i @~"<COUNT>"
abbr -a gra git rebase --abort
abbr -a grc git rebase --continue

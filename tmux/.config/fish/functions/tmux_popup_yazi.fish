function tmux_popup_yazi
    if not set -q TMUX
        return 1
    end

    argparse reset -- $argv

    if set -q _flag_reset
        set -e TMUX_POPUP_YAZI_DIR
    end

    set client_name (tmux display-message -p "#{client_name}")
    set temp_file (mktemp)
    tmux new-session -A \
        -s popup_yazi_$client_name \
        -e TMUXION_TARGET_CLIENT=$client_name \
        "command yazi --cwd-file=$temp_file $argv $TMUX_POPUP_YAZI_DIR"\; \
        set-hook client-detached kill-session\; \
        set-hook after-split-window kill-pane

    if test -s $temp_file
        set yazi_dir (cat $temp_file)

        if test -n $yazi_dir; and test -d $yazi_dir
            tmux set-environment TMUX_POPUP_YAZI_DIR $yazi_dir
        end
    end

    rm -f -- $temp_file
end

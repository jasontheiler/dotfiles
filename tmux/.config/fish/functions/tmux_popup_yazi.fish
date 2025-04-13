function tmux_popup_yazi
    argparse reset -- $argv

    if not set -q TMUX
        return 1
    end

    if set -q _flag_reset
        set -e TMUX_POPUP_YAZI_DIR
    end

    set -l temp_file (mktemp)
    command yazi --cwd-file=$temp_file $argv $TMUX_POPUP_YAZI_DIR
    set -l yazi_status $status

    if test -s $temp_file
        set -l yazi_dir (cat $temp_file)

        if test -n $yazi_dir; and test -d $yazi_dir
            tmux set-environment TMUX_POPUP_YAZI_DIR $yazi_dir
        end
    end

    rm -f -- $temp_file

    return $yazi_status
end

function tmux_popup_ranger
    argparse reset -- $argv

    if not set -q TMUX
        alert error "You are currently not in a tmux session!"
    end

    if set -q _flag_reset
        set -e TMUX_POPUP_RANGER_DIR
    end

    set -l temp_file (mktemp)
    command ranger --choosedir $temp_file $argv $TMUX_POPUP_RANGER_DIR
    set -l ranger_status $status

    if test -s $temp_file
        set -l ranger_dir (cat $temp_file)

        if test -n $ranger_dir; and test -d $ranger_dir
            tmux set-environment TMUX_POPUP_RANGER_DIR $ranger_dir
        end
    end

    rm -f -- $temp_file

    return $ranger_status
end

function yazi
    set -l temp_file (mktemp)
    command yazi --cwd-file=$temp_file $argv
    set -l yazi_status $status

    if test -s $temp_file
        set -l yazi_dir (cat $temp_file)

        if test -n $yazi_dir; and test -d $yazi_dir
            builtin cd -- $yazi_dir
        end
    end

    rm -f -- $temp_file

    return $yazi_status
end

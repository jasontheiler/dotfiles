function ranger
    set -l temp_file (mktemp)
    command ranger --choosedir=$temp_file $argv
    set -l ranger_status $status

    if test -s $temp_file
        set -l ranger_dir (cat $temp_file)

        if test -n $ranger_dir; and test -d $ranger_dir
            cd -- $ranger_dir
        end
    end

    rm -f -- $temp_file

    return $ranger_status
end

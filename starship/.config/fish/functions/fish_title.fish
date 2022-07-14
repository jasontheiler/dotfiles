# Prints fish's title.
function fish_title
    if test (id -u) -eq 0
        or test $USER != $LOGNAME
        or test $SSH_CONNECTION
        or test $SSH_CLIENT
        or test $SSH_TTY
        set title_username $USER " in "
    end

    if test $SSH_CONNECTION
        or test $SSH_CLIENT
        or test $SSH_TTY
        set title_hostname $hostname " in "
    end

    if test $argv
        set title_command " ❯ " $argv
    end

    echo -sn \
        $title_username \
        $title_hostname \
        (string replace $HOME "~" $PWD) \
        $title_command
end

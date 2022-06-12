# Prints the current username.
function title_username
    if test (id -u) -eq 0 \
            || test $USER != $LOGNAME \
            || test $SSH_CONNECTION \
            || test $SSH_CLIENT \
            || test $SSH_TTY
        echo -ns $USER " in "
    end
end

# Prints the current hostname.
function title_hostname
    if test $SSH_CONNECTION \
            || test $SSH_CLIENT \
            || test $SSH_TTY
        echo -ns $hostname " in "
    end
end

# Prints the executed command.
function title_command
    if test $argv
        echo -ns " ❯ " $argv
    end
end

# Prints fish's title.
function fish_title
    echo -ns \
        (title_username) \
        (title_hostname) \
        (string replace $HOME "~" $PWD) \
        (title_command $argv)
end

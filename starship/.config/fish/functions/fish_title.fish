# Prints the current username.
function title_username
    if [ (id -u) = 0 ] \
            || [ $USER != $LOGNAME ] \
            || [ $SSH_CONNECTION ] \
            || [ $SSH_CLIENT ] \
            || [ $SSH_TTY ]
        echo -n -s $USER " in "
    end
end

# Prints the current hostname.
function title_hostname
    if [ $SSH_CONNECTION ] \
            || [ $SSH_CLIENT ] \
            || [ $SSH_TTY ]
        echo -n -s $hostname " in "
    end
end

# Prints the executed command.
function title_command
    if [ $argv ]
        echo -n -s " ❯ " $argv
    end
end

# Prints fish's title.
function fish_title
    echo -n -s \
        (title_username) \
        (title_hostname) \
        (string replace "$HOME" "~" "$PWD") \
        (title_command $argv)
end

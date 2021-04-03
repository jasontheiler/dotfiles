# Prints the username.
function title_username
    if [ (id -u) = 0 ] \
            || [ $USER != $LOGNAME ] \
            || [ $SSH_CONNECTION ] \
            || [ $SSH_CLIENT ] \
            || [ $SSH_TTY ]
        echo -n -s $USER " in "
    end
end

# Prints the hostname.
function title_hostname
    if [ $SSH_CONNECTION ] \
            || [ $SSH_CLIENT ] \
            || [ $SSH_TTY ]
        echo -n -s $hostname " in "
    end
end

# Prints fish's title.
function fish_title
    echo -n -s (title_username) (title_hostname) (string replace "$HOME" "~" "$PWD")
end

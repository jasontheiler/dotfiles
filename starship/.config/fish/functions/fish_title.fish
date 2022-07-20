# Prints fish's title.
function fish_title
    if test (id -u) -eq 0
        or test "$USER" != "$LOGNAME"
        or set -q SSH_CONNECTION
        or set -q SSH_CLIENT
        or set -q SSH_TTY
        set title_username $USER " in "
    end

    if set -q SSH_CONNECTION
        or set -q SSH_CLIENT
        or set -q SSH_TTY
        set title_hostname $hostname " in "
    end

    if test (count $argv) -ge 1
        set title_command " ❯ " $argv
    end

    echo -sn \
        $title_username \
        $title_hostname \
        (string replace $HOME "~" $PWD) \
        $title_command
end

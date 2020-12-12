# Prints the username.
function title_username
  [ (id -u) = 0 ] \
  || [ $USER != $LOGNAME ] \
  || [ $SSH_CONNECTION ] \
  && echo -s -n $USER " in "
end

# Prints the hostname.
function title_hostname
  [ $SSH_CONNECTION ] && echo -s -n $hostname " in "
end

# Prints the title.
function fish_title
  echo -s -n (title_username) (title_hostname) (string replace $HOME "~" $PWD)
end

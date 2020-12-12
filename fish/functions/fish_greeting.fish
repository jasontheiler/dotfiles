# Prints the username.
function greeting_username
  if [ (id -u) = 0 ]
    echo -n "🚀 "
    set_color --bold red
  else
    echo -s -n "⚡ "
    set_color --bold yellow
  end

  echo -n $USER
  set_color normal
end

# Prints the hostname.
function greeting_hostname
  echo -s -n "💻 "
  set_color --bold green
  echo -n $hostname
  set_color normal
end

# Prints the greeting.
function fish_greeting
  echo -s \n (greeting_username) " on " (greeting_hostname)
end

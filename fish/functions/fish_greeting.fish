# Prints the username.
function greeting_username
  if [ (id -u) = 0 ]
    echo -s -n "🚀 " (set_color --bold red) $USER (set_color normal)
  else
    echo -s -n "⚡ " (set_color --bold yellow) $USER (set_color normal)
  end
end

# Prints the hostname.
function greeting_hostname
  echo -s -n "💻 " (set_color --bold green) $hostname (set_color normal)
end

# Prints the greeting.
function fish_greeting
  echo -s \n (greeting_username) " on " (greeting_hostname)
end

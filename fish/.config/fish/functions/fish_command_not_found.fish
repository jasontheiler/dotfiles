# Handles fish's "command not found" error.
function fish_command_not_found
    alert error "Command not found: " `$argv` \n
end

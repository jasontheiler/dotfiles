# See: https://fishshell.com/docs/current/prompt.html

function fish_prompt
    set -l last_status $status
    echo
    fish_prompt_pwd
    fish_prompt_git_branch
    echo
    fish_prompt_status $last_status
    fish_prompt_char
end

function fish_prompt_pwd
    set_color --bold cyan
    echo -n (prompt_pwd)
    if test $PWD != /
        echo -n /
    end
    set_color normal
end

function fish_prompt_git_branch
    set -l branch (git branch --show-current 2>/dev/null)
    if test $status -gt 0
        return
    end
    echo -n " on "
    set_color --bold magenta
    echo -n " $branch "
    set_color normal
end

function fish_prompt_status
    if test $argv[1] -eq 0
        return
    end
    set_color --bold red
    echo -n "[$argv[1]] "
    set_color normal
end

function fish_prompt_char
    switch $fish_bind_mode
        case default
            set_color blue
        case insert
            set_color green
        case replace_one
            set_color red
        case visual
            set_color magenta
    end
    set_color --bold
    echo -n "λ "
    set_color normal
end

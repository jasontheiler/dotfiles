# See: https://fishshell.com/docs/current/prompt.html

function fish_prompt
    set -l last_status $status
    echo
    fish_prompt_dir
    fish_prompt_git_branch
    fish_prompt_git_status
    echo
    fish_prompt_status $last_status
    fish_prompt_char
end

function fish_prompt_dir
    set_color --bold cyan
    set -l git_dir (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -eq 0
        echo -n (basename $git_dir)
        echo -n (prompt_pwd (string replace $git_dir "" $PWD))
    else
        echo -n (prompt_pwd)
    end
    if test $PWD != /
        echo -n /
    end
    set_color normal
end

function fish_prompt_git_branch
    set -l branch (git branch --show-current 2>/dev/null)
    if test $status -ne 0
        return
    end
    echo -n " on "
    set_color --bold magenta
    echo -n " $branch"
    set_color normal
end

function fish_prompt_git_status
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end
    set -l status_str ""
    if not git diff --quiet --ignore-submodules
        set status_str "$status_str!"
    end
    if not git diff --cached --quiet --ignore-submodules
        set status_str "$status_str+"
    end
    if not test -z (git ls-files --others --exclude-standard)
        set status_str "$status_str?"
    end
    set -l behind_ahead (git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)
    set -l behind (echo $behind_ahead | cut -d \t -f 1)
    if test $behind -gt 0
        set status_str $status_str↓$behind
    end
    set -l ahead (echo $behind_ahead | cut -d \t -f 2)
    if test $ahead -gt 0
        set status_str $status_str↑$ahead
    end
    if test -z $status_str
        return
    end
    set_color --bold red
    echo -n " [$status_str]"
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

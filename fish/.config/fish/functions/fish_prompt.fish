# See: https://fishshell.com/docs/current/prompt.html

function fish_prompt
    set last_status $status
    echo
    fish_prompt_login
    fish_prompt_dir
    fish_prompt_git_branch
    fish_prompt_git_status
    fish_prompt_git_divergence
    fish_prompt_k8s
    fish_prompt_separator
    echo
    fish_prompt_status $last_status
    fish_prompt_char
end

function fish_prompt_login
    if set -q SSH_TTY
        set login_str $USER@$hostname
    else
        if fish_is_root_user
            set login_str $USER
        else
            return
        end
    end
    set_color --bold yellow
    echo -n $login_str
    set_color normal
    fish_prompt_separator
end

function fish_prompt_dir
    set_color --bold cyan
    set git_dir (git rev-parse --show-toplevel 2>/dev/null)
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
    set branch (git branch --show-current 2>/dev/null)
    if test $status -ne 0
        return
    end
    fish_prompt_separator
    set_color --bold magenta
    echo -n  (string shorten --max=20 $branch)
    set_color normal
end

function fish_prompt_git_status
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end
    set status_str ""
    if not git diff --quiet --ignore-submodules
        set status_str $status_str"!"
    end
    if not git diff --cached --quiet --ignore-submodules
        set status_str $status_str"+"
    end
    if not test -z "$(git ls-files --others --exclude-standard)"
        set status_str $status_str"?"
    end
    if test -z $status_str
        return
    end
    set_color --bold red
    echo -n " "$status_str
    set_color normal
end

function fish_prompt_git_divergence
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end
    set divergence_str ""
    set behind_ahead "$(git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)"
    if not test -z $behind_ahead
        set -l behind (echo $behind_ahead | cut --delimiter=\t --fields=1)
        if test $behind -gt 0
            set divergence_str $divergence_str↓$behind
        end
        set -l ahead (echo $behind_ahead | cut --delimiter=\t --fields=2)
        if test $ahead -gt 0
            set divergence_str $divergence_str↑$ahead
        end
    end
    if test -z $divergence_str
        return
    end
    set_color --bold yellow
    echo -n " "$divergence_str
    set_color normal
end

function fish_prompt_k8s
    set k8s_config (cat $HOME/.kube/config 2>/dev/null)
    if test $status -ne 0
        return
    end
    string match -rq 'current-context:\s"?(?<ctx>[^"]+)"?' -- $k8s_config
    if test -z "$ctx"
        return
    end
    string match -rq \
        '\s{4}namespace:\s"?(?<ns>[^";]+)"?;(\s{4}[^;]+;)*\s{2}name:\s"?'$ctx'"?' \
        -- \
        "$(string join ';' -- $k8s_config)"
    fish_prompt_separator
    set_color --bold blue
    echo -n 󱃾 $ctx
    if not test -z "$ns"
        echo -n /$ns
    end
    set_color normal
end

function fish_prompt_status
    if test $argv[1] -eq 0
        return
    end
    set_color --bold red
    echo -n (fish_status_to_signal $argv[1])" "
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
    echo -n "󰈺 "
    set_color normal
end

function fish_prompt_separator
    set_color brblack
    echo -n "; "
    set_color normal
end

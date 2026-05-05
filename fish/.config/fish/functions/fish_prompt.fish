# See: https://fishshell.com/docs/current/prompt.html

function fish_prompt
    set last_status $status
    echo
    fish_prompt_with_trailing_space (fish_prompt_login)
    fish_prompt_with_trailing_space (fish_prompt_dir)
    fish_prompt_with_trailing_space (fish_prompt_git)
    fish_prompt_with_trailing_space (fish_prompt_k8s)
    echo
    fish_prompt_with_trailing_space (fish_prompt_status $last_status)
    fish_prompt_with_trailing_space (fish_prompt_char)
end

function fish_prompt_with_trailing_space
    if test (count $argv) -gt 0
        echo -n $argv" "
    end
end

function fish_prompt_login
    if set -q SSH_CLIENT; or set -q SSH_CONNECTION; or set -q SSH_TTY
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
    set_color normal
end

function fish_prompt_git
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end
    fish_prompt_git_branch_or_commit
    fish_prompt_git_status
    fish_prompt_git_divergence
end

function fish_prompt_git_branch_or_commit
    set_color --bold magenta
    set branch (git branch --show-current 2>/dev/null)
    if not test -z "$branch"
        echo -n  (string shorten --max=20 $branch)
    else
        echo -n ◯ (git rev-parse --short HEAD 2>/dev/null)
    end
    set_color normal
end

function fish_prompt_git_status
    if test -z "$(git status --porcelain 2>/dev/null)"
        return
    end
    set_color --bold red
    echo -n " "[+]
    set_color normal
end

function fish_prompt_git_divergence
    set divergence_str ""
    set behind_ahead "$(git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)"
    if not test -z "$behind_ahead"
        set -l behind (echo $behind_ahead | cut --delimiter=\t --fields=1)
        if test $behind -gt 0
            set divergence_str $divergence_str↓$behind
        end
        set -l ahead (echo $behind_ahead | cut --delimiter=\t --fields=2)
        if test $ahead -gt 0
            set divergence_str $divergence_str↑$ahead
        end
    end
    if test -z "$divergence_str"
        return
    end
    set_color --bold yellow
    echo -n " "$divergence_str
    set_color normal
end

function fish_prompt_k8s
    if set -q KUBECONFIG
        set config_file (string split : $KUBECONFIG)[1]
    else
        set config_file $HOME/.kube/config
    end
    set mtime (stat -c %Y $config_file 2>/dev/null)
    if test "$mtime" != "$fish_prompt_k8s_mtime"
        set -g fish_prompt_k8s_mtime $mtime
        set tmpl '{{range .contexts}}{{.name}}{{with .context.namespace}}/{{.}}{{end}}{{end}}'
        set -g fish_prompt_k8s_value (kubectl config view --minify --output=go-template=$tmpl 2>/dev/null)
    end
    if test -z "$fish_prompt_k8s_value"
        return
    end
    set_color blue
    echo -n "󱃾 "
    set_color --bold
    echo -n $fish_prompt_k8s_value
    set_color normal
end

function fish_prompt_status
    if test $argv[1] -eq 0
        return
    end
    set_color --bold red
    echo -n (fish_status_to_signal $argv[1])
    set_color normal
end

function fish_prompt_char
    switch $fish_bind_mode
        case default
            set_color blue
            echo -n "N "
        case insert
            set_color green
            echo -n "I "
        case replace replace_one
            set_color red
            echo -n "R "
        case visual
            set_color magenta
            echo -n "V "
    end
    set_color normal --bold
    if fish_is_root_user
        echo -n "#"
    else
        echo -n "\$"
    end
    set_color normal
end

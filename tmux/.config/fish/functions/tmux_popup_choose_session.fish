function tmux_popup_choose_session
    if not set -q TMUX
        alert error "You are currently not in a tmux session!"
    end

    stty -echo 2>/dev/null
    tput sc
    tput civis

    set -l SHOWN_SESSIONS_COUNT 7
    set -l middle_session_idx (math ceil (math \($SHOWN_SESSIONS_COUNT / 2\) - 1))

    set -l sessions \
        (tmux list-sessions -F "#{s|$HOME|~|:session_path}/;#{session_name}" | LC_COLLATE=C sort)
    set -l current_session_name (tmux display-message -p "#{client_session}")

    set -l selected_session_idx 0
    for i in (seq 1 (count $sessions))
        if test (string split ";" $sessions[$i])[-1] = $current_session_name
            set selected_session_idx (math $i - 1)
        end
    end

    set -l term_width (tput cols)
    set -l title (echo -s \
        (set_color "#f2cdcd") \
        " " \
        (string repeat -Nn (math \($term_width / 2\) - 9) " ") \
        "Choose Session" \
        (set_color normal) \
        | string pad -rw (math $term_width - 2)
    )

    set -l kill_initiated false

    set -l renders 0
    while true
        tput rc

        if test $renders -ge 1
            read -l -P "$(echo $title)" -n 1 input

            switch "$input"
                case j
                    set kill_initiated false
                    set selected_session_idx \
                        (math \($selected_session_idx + 1\) % (count $sessions))
                case k
                    set kill_initiated false
                    set selected_session_idx \
                        (math \($selected_session_idx - 1 + (count $sessions)\) % (count $sessions))
                case x
                    set kill_initiated true
                case n
                    set kill_initiated false
                case y
                    if $kill_initiated
                        set -l killed_session_name \
                            (string split ";" $sessions[(math $selected_session_idx + 1)])[-1]

                        tmux kill-session -t $killed_session_name

                        set -e sessions[(math $selected_session_idx + 1)]
                        set selected_session_idx (math $selected_session_idx % (count $sessions))
                        set kill_initiated false
                    end
                case q ''
                    break
            end

            tmux switch-client -t (string split ";" $sessions[(math $selected_session_idx + 1)])[-1]
        else
            echo $title
        end

        set -l output (string pad -w $term_width \n)

        for i in (seq 0 (math $SHOWN_SESSIONS_COUNT - 1))
            set -l session_idx (math \($selected_session_idx + \((math ceil (math $middle_session_idx / (count $sessions))) \* (count $sessions)\) + \($i - $middle_session_idx\)\) % (count $sessions))
            set -l session_str (echo \
                (string split ";" $sessions[(math $session_idx + 1)])[1] \
                | string sub -l (math $term_width - 2) \
                | string pad -rw (math $term_width - 2) \
            )

            if test $i -eq $middle_session_idx
                if $kill_initiated
                    set -a output \
                        (set_color -b "#32283a" red) \
                        "? " \
                        (set_color -b "#32283a" red)
                else
                    set -a output \
                        (set_color -b "#313244" "#f2cdcd") \
                        "❯ " \
                        (set_color -b "#313244" normal)
                end
            else
                set -a output "  "
            end

            set -a output $session_str

            if test $i -ne (math $SHOWN_SESSIONS_COUNT - 1)
                set -a output \n (set_color normal)
            end
        end

        echo -sn $output
        set renders (math $renders + 1)
    end
end

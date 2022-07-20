# Prints common ANSI escape codes.
function esc -d "Prints common ANSI escape codes."
    set count $argv[-1]

    if not string match -qr '^\d+$' $count
        or test $count -lt 1
        set count 1
    end

    switch $argv[1]
        case cursor
            switch $argv[2]
                case up
                    set code $count A
                case down
                    set code $count B
                case forward
                    set code $count C
                case backward
                    set code $count D
                case next_line
                    set code $count E
                case prev_line
                    set code $count F
                case column
                    set code $count G
                case show
                    set code '?25h'
                case hide
                    set code '?25l'
            end
        case erase
            switch $argv[2]
                case line
                    set code 2K
                case line_start
                    set code 1K
                case line_end
                    set code 0K
            end
    end

    if not set -q code
        return 1
    end

    echo -sn (string unescape (string join '' '\x1B[' $code))
end

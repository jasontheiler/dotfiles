# ...
function esc -d "..."
    set count $argv[-1]

    if not string match -qr '^\d+$' $count
        or test $count -lt 1
        set count 1
    end

    switch $argv[1]
        case cursor
            switch $argv[2]
                case up
                    set code '\x1B[1A'
                case down
                    set code '\x1B[1B'
                case forward
                    set code '\x1B[1C'
                case backward
                    set code '\x1B[1D'
                case next_line
                    set code '\x1B[E'
                case prev_line
                    set code '\x1B[F'
                case hide
                    set code '\x1B[?25l'
                case show
                    set code '\x1B[?25h'
                case save
                    set code '\x1B7'
                case load
                    set code '\x1B8'
            end
        case erase
            switch $argv[2]
                case line
                    set code "\x1B[2K"
                case screen
                    set code "\x1B[2J"
            end
        case scroll
            switch $argv[2]
                case up
                    set code '\x1B[S'
                case down
                    set code '\x1B[T'
            end
    end

    if test -z $code
        return 1
    end

    set -l i 1
    while test $i -le $count
        echo -sn (string unescape $code)
        set i (math $i + 1)
    end
end

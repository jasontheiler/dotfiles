# ...
function alert -d "..."
    if not contains $argv[1] error warning info success
        return 1
    end

    switch $argv[1]
        case error
            set icon 🚨
            set color red
        case warning
            set icon 🚧
            set color yellow
        case info
            set icon 📱
            set color blue
        case success
            set icon ✅
            set color green
    end

    echo -es \
        \n \
        (set_color -r $color) \
        " $icon " \
        (string upper $argv[1]) \
        ": " \
        (set_color normal) \
        (set_color $color) \
        " $argv[2..]"
end

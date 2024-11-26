function checklist
    checklist_list Core \
        curl \
        fish \
        git \
        lazygit \
        npm \
        nvim \
        paru \
        ranger \
        rg \
        scp \
        ssh \
        stow \
        tmux
    checklist_list Extra \
        bat \
        btm \
        cargo \
        docker \
        direnv \
        dust \
        git-open \
        go \
        hyperfine \
        jq \
        kubectl \
        mkcert \
        mtr \
        oha \
        ouch \
        prettier \
        rustup \
        staticcheck \
        tilt \
        tldr
end

function checklist_list
    echo \n$argv[1]:\n
    set installed_count 0
    for bin in $argv[2..]
        echo -n "  "
        if fish -c "command -q $bin"
            set installed_count (math $installed_count + 1)
            set_color --bold green
            echo -n 
            set_color normal
        else
            set_color --bold red
            echo -n 
            set_color normal
        end
        echo " "$bin
    end
    echo \n $installed_count/(count $argv[2..]) installed
end

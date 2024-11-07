function checklist
    checklist_check_packages Core \
        curl \
        eza \
        fish \
        git \
        lazygit \
        nvim \
        paru \
        ranger \
        rg \
        scp \
        ssh \
        stow \
        tmux
    checklist_check_packages Extra \
        bat \
        btm \
        docker \
        direnv \
        dust \
        fnm \
        git-open \
        go \
        hyperfine \
        jq \
        kubectl \
        mkcert \
        oha \
        ouch \
        rustup \
        tilt \
        tldr
end

function checklist_check_packages
    echo \n$argv[1] packages:
    set -l installed_count 0
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

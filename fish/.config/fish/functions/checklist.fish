function checklist
    set -l bins \
        bat \
        brew \
        btm \
        curl \
        docker \
        direnv \
        dust \
        eza \
        fish \
        fnm \
        git \
        git-open \
        go \
        gpg \
        gsed \
        hyperfine \
        jq \
        kubectl \
        lazygit \
        mkcert \
        nvim \
        oha \
        ouch \
        paru \
        ranger \
        rg \
        rustup \
        scp \
        ssh \
        starship \
        stow \
        tilt \
        tmux

    set -l installed_count 0

    for bin in (string pad $bins)
        echo -sn $bin " "

        if fish -c "command -q $bin"
            set installed_count (math $installed_count + 1)
            echo -s (set_color green)  (set_color normal)
        else
            echo -s (set_color red)  (set_color normal)
        end
    end

    echo -s \n $installed_count / (count $bins) " installed"
end

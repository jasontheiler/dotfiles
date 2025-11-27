# See: https://fnm.vercel.app/
fnm env --shell=fish --use-on-cd | source

# See: https://fnm.vercel.app/#completions
set completions_file $HOME/.config/fish/completions/fnm.fish
if ! test -e $completions_file
    fnm completions --shell=fish >$completions_file
end

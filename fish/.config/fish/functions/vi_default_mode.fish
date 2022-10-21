# Sets the default Vi mode, when a new prompt is about to be shown.
function vi_default_mode \
  -e fish_prompt \
  -d "Sets the default Vi mode, when a new prompt is about to be shown."
    set fish_bind_mode default
end

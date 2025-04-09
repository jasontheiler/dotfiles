# Catppuccin Mocha
# set -l colors \
#     ROSEWATER "#F5E0DC" \
#     FLAMINGO "#F2CDCD" \
#     PINK "#F5C2E7" \
#     MAUVE "#CBA6F7" \
#     RED "#F38BA8" \
#     MAROON "#EBA0AC" \
#     PEACH "#FAB387" \
#     YELLOW "#F9E2AF" \
#     GREEN "#A6E3A1" \
#     TEAL "#94E2D5" \
#     SKY "#89DCEB" \
#     SAPPHIRE "#74C7EC" \
#     BLUE "#89B4FA" \
#     LAVENDER "#B4BEFE" \
#     TEXT "#CDD6F4" \
#     SUBTEXT1 "#BAC2DE" \
#     SUBTEXT0 "#A6ADC8" \
#     OVERLAY2 "#9399B2" \
#     OVERLAY1 "#7F849C" \
#     OVERLAY0 "#6C7086" \
#     SURFACE2 "#585B70" \
#     SURFACE1 "#45475A" \
#     SURFACE0 "#313244" \
#     BASE "#1E1E2E" \
#     MANTLE "#181825" \
#     CRUST "#11111B"

# Catppuccin Cocoa
set -l colors \
    ROSEWATER "#DAA992" \
    FLAMINGO "#DAA992" \
    PINK "#C386BB" \
    MAUVE "#C386BB" \
    RED "#EA6962" \
    MAROON "#D3869B" \
    PEACH "#DD7F4E" \
    YELLOW "#E8C677" \
    GREEN "#A9B665" \
    TEAL "#89B482" \
    SKY "#89B482" \
    SAPPHIRE "#89B482" \
    BLUE "#7DAEB3" \
    LAVENDER "#BDAEC3" \
    TEXT "#E4CEA8" \
    SUBTEXT1 "#DCC6A0" \
    SUBTEXT0 "#D4BE98" \
    OVERLAY2 "#877360" \
    OVERLAY1 "#7D6C60" \
    OVERLAY0 "#75615B" \
    SURFACE2 "#615556" \
    SURFACE1 "#534747" \
    SURFACE0 "#433737" \
    BASE "#211D1D" \
    MANTLE "#191414" \
    CRUST "#110D0D"

# Catppuccin Neo
# set -l colors \
#     ROSEWATER "#FFCDCD" \
#     FLAMINGO "#FFCDCD" \
#     PINK "#E3AAFF" \
#     MAUVE "#E3AAFF" \
#     RED "#FF87BC" \
#     MAROON "#F394B8" \
#     PEACH "#FFB7AB" \
#     YELLOW "#F9E6C0" \
#     GREEN "#B3F6C0" \
#     TEAL "#8CF8F7" \
#     SKY "#8CF8F7" \
#     SAPPHIRE "#8CF8F7" \
#     BLUE "#A6DBFF" \
#     LAVENDER "#C4BEFF" \
#     TEXT "#E0E2EA" \
#     SUBTEXT1 "#B9BCC7" \
#     SUBTEXT0 "#A5A8B5" \
#     OVERLAY2 "#9295A4" \
#     OVERLAY1 "#7E8192" \
#     OVERLAY0 "#6B6D81" \
#     SURFACE2 "#585A6F" \
#     SURFACE1 "#45475D" \
#     SURFACE0 "#32334B" \
#     BASE "#14161B" \
#     MANTLE "#0C0E13" \
#     CRUST "#04060B"

for i in (seq 1 2 (count $colors))
    set -l k $colors[$i]
    set -l v $colors[(math $i + 1)]
    set -x CATPPUCCIN_$k $v
end

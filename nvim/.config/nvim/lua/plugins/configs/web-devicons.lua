local web_devicons = require("nvim-web-devicons")
local catppuccin_palettes = require("catppuccin/palettes")

local palette = catppuccin_palettes.get_palette("mocha")

-- See: https://github.com/kyazdani42/nvim-web-devicons#usage
web_devicons.setup({
    override = {
        [".dockerignore"] = {
            name = "Dockerignore",
            icon = "",
            color = palette.sapphire,
        },
        [".gitattributes"] = {
            name = "GitAttributes",
            icon = "",
            color = palette.peach,
        },
        [".gitconfig"] = {
            name = "GitConfig",
            icon = "",
            color = palette.peach,
        },
        [".gitignore"] = {
            name = "GitIgnore",
            icon = "",
            color = palette.peach,
        },
        [".gitkeep"] = {
            name = "GitKeep",
            icon = "",
            color = palette.peach,
        },
        [".npmignore"] = {
            name = "NPMIgnore",
            icon = "",
            color = palette.red,
        },
        [".npmrc"] = {
            name = "NPMrc",
            icon = "",
            color = palette.red,
        },
        ["cjs"] = {
            name = "Cjs",
            icon = "",
            color = palette.yellow,
        },
        ["conf"] = {
            name = "Conf",
            icon = "",
            color = palette.flamingo,
        },
        ["COPYING"] = {
            name = "License",
            icon = "",
            color = palette.red,
        },
        ["COPYING.LESSER"] = {
            name = "License",
            icon = "",
            color = palette.red,
        },
        ["css"] = {
            name = "Css",
            icon = "",
            color = palette.blue,
        },
        ["default_icon"] = {
            name = "Default",
            icon = "",
            color = palette.lavender,
        },
        ["dockerfile"] = {
            name = "Dockerfile",
            icon = "",
            color = palette.sapphire,
        },
        ["Dockerfile"] = {
            name = "Dockerfile",
            icon = "",
            color = palette.sapphire,
        },
        ["fish"] = {
            name = "Fish",
            icon = "",
            color = palette.green,
        },
        ["git"] = {
            name = "GitLogo",
            icon = "",
            color = palette.peach,
        },
        [".gitlab-ci.yml"] = {
            name = "GitlabCI",
            icon = "",
            color = palette.peach,
        },
        ["go"] = {
            name = "Go",
            icon = "",
            color = palette.sapphire,
        },
        ["html"] = {
            name = "Html",
            icon = "",
            color = palette.peach,
        },
        ["js"] = {
            name = "Js",
            icon = "",
            color = palette.yellow,
        },
        ["json"] = {
            name = "Json",
            icon = "",
            color = palette.yellow,
        },
        ["license"] = {
            name = "License",
            icon = "",
            color = palette.red,
        },
        ["LICENSE"] = {
            name = "License",
            icon = "",
            color = palette.red,
        },
        ["lock"] = {
            name = "Lock",
            icon = "",
            color = palette.yellow,
        },
        ["lua"] = {
            name = "Lua",
            icon = "",
            color = palette.blue,
        },
        ["luau"] = {
            name = "Luau",
            icon = "",
            color = palette.blue,
        },
        ["md"] = {
            name = "Md",
            icon = "",
            color = palette.blue,
        },
        ["mjs"] = {
            name = "Mjs",
            icon = "",
            color = palette.yellow,
        },
        ["package.json"] = {
            name = "PackageJson",
            icon = "",
            color = palette.green,
        },
        ["package-lock.json"] = {
            name = "PackageLockJson",
            icon = "",
            color = palette.green,
        },
        ["rs"] = {
            name = "Rs",
            icon = "",
            color = palette.peach,
        },
        ["svg"] = {
            name = "Svg",
            icon = "ﰟ",
            color = palette.yellow,
        },
        ["toml"] = {
            name = "Toml",
            icon = "",
            color = palette.sapphire,
        },
        ["ts"] = {
            name = "Ts",
            icon = "ﯤ",
            color = palette.blue,
        },
        ["vue"] = {
            name = "Vue",
            icon = "﵂",
            color = palette.green,
        },
        ["yaml"] = {
            name = "Yaml",
            icon = "",
            color = palette.red,
        },
        ["yml"] = {
            name = "Yml",
            icon = "",
            color = palette.red,
        },
    },
})

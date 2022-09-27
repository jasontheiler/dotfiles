require("plugins")
require("plugins/gitsigns")
require("plugins/lualine")
require("plugins/telescope")
require("plugins/treesitter")

local cmd = vim.cmd
local opt = vim.opt

opt.history = 1000
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.fillchars = "eob: "
opt.mouse = "a"

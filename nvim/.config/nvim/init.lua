require("plugins")
require("plugins/gitsigns")
require("plugins/indent_blankline")
require("plugins/lualine")
require("plugins/telescope")
require("plugins/treesitter")

local cmd = vim.cmd
local opt = vim.opt

opt.hidden = true
opt.showmode = false
opt.history = 1000
opt.mouse = "a"
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.fillchars = "eob: "

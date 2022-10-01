local opt = vim.opt

opt.termguicolors = true
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.history = 1000
opt.mouse = "a"
opt.signcolumn = "yes"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.fillchars = { eob = " " }
opt.shortmess:append("sI") -- disables nvim intro
opt.splitbelow = true
opt.splitright = true

local g = vim.g

g.loaded = 1
g.loaded_netrwPlugin = 1

require("keymaps")
require("autocmds")
require("plugins")

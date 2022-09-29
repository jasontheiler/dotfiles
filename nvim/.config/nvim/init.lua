local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.laststatus = 3 -- global statusline
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

g.loaded = 1
g.loaded_netrwPlugin = 1

require("plugins")

local opt = vim.opt

opt.termguicolors = true
opt.laststatus = 3
opt.shortmess = "fIlnxtToOF"
opt.showmode = false
opt.hidden = true
opt.clipboard = "unnamedplus"
opt.history = 1000
opt.mouse = "a"
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.cursorline = true
opt.cursorlineopt = "number"
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.colorcolumn = { 80, 100 }
opt.fillchars = { eob = " " }
opt.splitbelow = true
opt.splitright = true

local g = vim.g

g.mapleader = " "
g.loaded = 1
g.loaded_netrwPlugin = 1

require("keymaps")
require("autocmds")
require("plugins")

vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.shortmess = "fIlnxtToOF"
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.clipboard = "unnamedplus"
vim.opt.history = 1000
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.colorcolumn = { 80, 100 }
vim.opt.fillchars = { eob = " " }
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("keymaps")
require("autocmds")
require("plugins")

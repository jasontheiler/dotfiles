vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.shortmess = "oOtTICF"
vim.opt.showmode = false
vim.opt.shadafile = "NONE"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo/"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 16
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.colorcolumn = { 80, 100, 120 }
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·" }
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "rounded"
vim.opt.fillchars = { stl = "─", stlnc = "─" }
vim.opt.statusline = "%="
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { prefix = "" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  }
})

vim.filetype.add({
  pattern = {
    [".*[tT]iltfile"] = "starlark",
    ["ghostty/(themes/.+|config)"] = "config",
  },
})

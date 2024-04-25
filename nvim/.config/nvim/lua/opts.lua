vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.shortmess = "oOtTICF"
vim.opt.showmode = false
vim.opt.shadafile = "NONE"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo/"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.colorcolumn = { 80, 100 }
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })

vim.diagnostic.config({ severity_sort = true, float = { border = "single" } })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "single" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "single" }
)

vim.filetype.add({
  pattern = {
    [".*[tT]iltfile"] = "starlark",
    [".env.*"] = "sh",
  },
})

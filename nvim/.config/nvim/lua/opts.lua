vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.shortmess = "fIlnxtToOF"
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.shadafile = "NONE"
vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo/"
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
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  eob = " ",
}

vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 3, prefix = "" },
  float = { border = "single" },
})

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

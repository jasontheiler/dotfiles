local utils = require("utils")

utils.keymap({ "n", "v" }, "<Space>", "<Nop>")
utils.keymap({ "n", "v" }, "K", "<Nop>")

utils.keymap("x", "<Leader>p", "\"_dP")

utils.keymap("n", "<Leader>s", ":w<CR>")
utils.keymap("n", "<Leader>qq", ":qa<CR>")

utils.keymap("n", "<Leader>w", "<C-w>")
utils.keymap("n", { "<C-w><C-h>", "<Leader>w<C-h>" }, "<C-w><")
utils.keymap("n", { "<C-w><C-j>", "<Leader>w<C-j>" }, "<C-w>+")
utils.keymap("n", { "<C-w><C-k>", "<Leader>w<C-k>" }, "<C-w>-")
utils.keymap("n", { "<C-w><C-l>", "<Leader>w<C-l>" }, "<C-w>>")

utils.keymap("n", "[d", vim.diagnostic.goto_prev)
utils.keymap("n", "]d", vim.diagnostic.goto_next)
utils.keymap("n", "<Leader>d", vim.diagnostic.open_float)

utils.keymap("t", "<Esc>", "<C-\\><C-n>")

utils.keymap("n", "<Leader>n", ":e ${HOME}/notes.md<CR>")

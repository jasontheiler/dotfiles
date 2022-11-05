local keymap = require("utils").keymap

keymap({ "n", "v" }, "<Space>", "<Nop>")

keymap("n", "<Leader>s", ":w<CR>")
keymap("n", "<Leader>qq", ":q<CR>")
keymap("n", "<Leader>qf", ":q!<CR>")
keymap("n", "<Leader>qa", ":qa<CR>")

keymap("n", "<Leader>bx", ":bd<CR>")

keymap("n", "<Leader>w", "<C-w>")
keymap("n", { "<C-w><C-h>", "<Leader>w<C-h>" }, "<C-w><")
keymap("n", { "<C-w><C-j>", "<Leader>w<C-j>" }, "<C-w>+")
keymap("n", { "<C-w><C-k>", "<Leader>w<C-k>" }, "<C-w>-")
keymap("n", { "<C-w><C-l>", "<Leader>w<C-l>" }, "<C-w>>")

keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<Leader>d", vim.diagnostic.open_float)

keymap("t", "<Esc>", "<C-\\><C-n>")

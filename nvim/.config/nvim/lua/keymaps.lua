local keymap = require("utils").keymap

keymap({ "n", "v" }, "<Space>", "<Nop>")

keymap("n", "<Leader>s", ":w<CR>")
keymap("n", "<Leader>qq", ":q<CR>")
keymap("n", "<Leader>qf", ":q!<CR>")
keymap("n", "<Leader>qa", ":qa<CR>")

keymap("n", "<Leader>w", "<C-w>")

keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<Leader>d", vim.diagnostic.open_float)

keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")

keymap("t", "<Esc>", "<C-\\><C-n>")

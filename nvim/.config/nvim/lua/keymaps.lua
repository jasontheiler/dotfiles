local keymap = require("utils").keymap

keymap("n", "<Space>", "<Nop>")

keymap("n", "<Leader>s", ":w<CR>")
keymap("n", "<Leader>qq", ":q<CR>")
keymap("n", "<Leader>qa", ":qa<CR>")

keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")

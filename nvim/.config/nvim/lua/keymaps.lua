local api = vim.api

api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true })
api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true })
api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true })
api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true })

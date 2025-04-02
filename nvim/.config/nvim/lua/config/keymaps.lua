vim.keymap.set({ "n", "v" }, " ", "<Nop>")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"_dP", { desc = "Paste (without yank)" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Move cursor to window above (wrap)" })
vim.keymap.set("n", "<leader>wW", "<C-w><C-w>", { desc = "Move cursor to window below (wrap)" })
vim.keymap.set("n", "<leader>wx", "<C-w>q", { desc = "Close current" })

vim.keymap.set("n", "<leader>bx", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
  if file_name == "" or not modified then
    vim.cmd.bdelete({ bang = true })
    return
  end
  local choice = vim.fn.confirm("Buffer has unwritten changes…", "&Write\n&Don't write")
  if choice == 0 then
    return
  end
  if choice == 1 then
    vim.cmd.write()
  end
  vim.cmd.bdelete({ bang = true })
end, { desc = "Close current" })

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>n", ":e ${HOME}/notes.md<CR>", { desc = "Notes" })

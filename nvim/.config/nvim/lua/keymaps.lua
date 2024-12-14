local utils = require("utils")

utils.keymap({ "n", "v" }, " ", "<Nop>")
utils.keymap({ "n", "v" }, "<leader>p", "\"_dP", "Paste (without yank)")

utils.keymap("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")

utils.keymap("n", "<leader>ww", "<C-w>w", "Move cursor to window above (wrap)")
utils.keymap("n", "<leader>wW", "<C-w><C-w>", "Move cursor to window below (wrap)")
utils.keymap("n", "<leader>wx", "<C-w>q", "Close current")

utils.keymap("n", "<leader>bx", function()
  local filename = vim.api.nvim_buf_get_name(0)
  local modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
  if filename == "" or not modified then
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
end, "Close current")

utils.keymap("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
utils.keymap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
utils.keymap("n", "<leader>d", vim.diagnostic.open_float, "Diagnostics")

utils.keymap("n", "<leader>n", ":e ${HOME}/notes.md<CR>", "Notes")

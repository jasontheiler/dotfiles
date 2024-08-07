local utils = require("utils")

utils.keymap("t", "<Esc>", "<C-\\><C-n>", "Exit terminal mode")
utils.keymap({ "n", "v" }, " ", "<Nop>")
utils.keymap({ "n", "v" }, "<leader>p", "\"_dP", "Paste (without yank)")

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

utils.keymap("n", "<leader>rh", function()
  if vim.fn.executable("openssl") == 0 then
    vim.notify("`openssl` not found", vim.log.levels.ERROR)
    return
  end
  local input = vim.fn.input("Number of bytes: ")
  local length = tonumber(input)
  if length == nil or length % 1 ~= 0 then
    vim.notify(input .. " is not a valid integer", vim.log.levels.ERROR)
    return
  end
  local hex = vim.fn.systemlist("openssl rand -hex " .. length)[1]
  vim.fn.setreg("+", hex, "c")
  vim.notify("Copied to clipboard: " .. hex, vim.log.levels.INFO)
end, "Hexadecimal string")
utils.keymap("n", "<leader>ru", function()
  if vim.fn.executable("uuidgen") == 0 then
    vim.notify("`uuidgen` not found", vim.log.levels.ERROR)
    return
  end
  local uuid = vim.fn.systemlist("uuidgen")[1]
  vim.fn.setreg("+", uuid, "c")
  vim.notify("Copied to clipboard: " .. uuid, vim.log.levels.INFO)
end, "UUID")

local M = {}

M.print = function(text)
  vim.schedule(function()
    vim.print(text)
  end)
end

M.keymap = function(modes, lhss, rhs, opts)
  if type(lhss) ~= "table" then
    lhss = { lhss }
  end

  local default_opts = { noremap = true, silent = true }
  opts = vim.tbl_extend("force", default_opts, opts or {})

  for _, lhs in pairs(lhss) do
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

M.insert_text = function(text)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local char = vim.api.nvim_buf_get_text(0, row - 1, col, row - 1, col + 1, {})[1]
  local col_offset = 1
  if char == "" then
    col_offset = 0
  end
  vim.api.nvim_buf_set_text(0, row - 1, col + col_offset, row - 1, col + col_offset, { text })
end

-- Can possibly be replaced with `truncate` function of: https://github.com/nvim-lua/plenary.nvim#plenarystrings
M.truncate = function(s, max_len, ellipsis)
  if type(ellipsis) ~= "boolean" then
    ellipsis = true
  end

  if #s <= max_len then
    return s
  end

  if ellipsis then
    return s:sub(1, max_len - 1) .. "…"
  else
    return s:sub(1, max_len)
  end
end

return M

local M = {}

M.print = function(text)
  vim.schedule(function()
    vim.print(text)
  end)
end

M.keymap = function(modes, lhs, rhs, desc, opts)
  local default_opts = { noremap = true, desc = desc }
  opts = vim.tbl_extend("force", default_opts, opts or {})
  vim.keymap.set(modes, lhs, rhs, opts)
end

return M

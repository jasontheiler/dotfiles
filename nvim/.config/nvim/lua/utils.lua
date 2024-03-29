local M = {}

M.keymap = function(modes, lhs, rhs, desc, opts)
  local default_opts = { noremap = true, silent = true, desc = desc }
  opts = vim.tbl_extend("force", default_opts, opts or {})
  vim.keymap.set(modes, lhs, rhs, opts)
end

return M

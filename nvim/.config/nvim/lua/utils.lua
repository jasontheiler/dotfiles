local M = {}

--- Adds a new mapping with some customized defaults.
---
--- @param modes string|string[]
--- @param lhs string
--- @param rhs string|function
--- @param desc? string
--- @param opts? vim.keymap.set.Opts
function M.keymap(modes, lhs, rhs, desc, opts)
  local default_opts = { noremap = true, silent = true, desc = desc }
  opts = vim.tbl_extend("force", default_opts, opts or {})
  vim.keymap.set(modes, lhs, rhs, opts)
end

return M

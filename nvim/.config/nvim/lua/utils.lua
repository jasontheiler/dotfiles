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

  local default_opts = { noremap = true }
  opts = vim.tbl_extend("force", default_opts, opts or {})

  for _, lhs in pairs(lhss) do
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

return M

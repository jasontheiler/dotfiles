local M = {}

M.keymap = function(modes, lhss, rhs, opts)
  if type(modes) ~= "table" then
    modes = { modes }
  end

  if type(lhss) ~= "table" then
    lhss = { lhss }
  end

  local default_opts = { noremap = true, silent = true }
  opts = vim.tbl_extend("force", default_opts, opts or {})

  for _, mode in pairs(modes) do
    for _, lhs in pairs(lhss) do
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

return M

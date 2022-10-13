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

M.limit_len = function(s, max_len, ellipsis)
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

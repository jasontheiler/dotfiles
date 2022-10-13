local feline = require("feline")

local M = {}

M.provider = function(sep)
  local client_names = {}

  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    table.insert(client_names, client.name)
  end

  return table.concat(client_names, string.format(" %s ", feline.separators[sep] or sep))
end

return M

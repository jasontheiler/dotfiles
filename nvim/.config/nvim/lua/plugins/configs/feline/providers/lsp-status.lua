local lsp_status = require("lsp-status")

local M = {}

M.provider = function()
  return lsp_status.status()
end

return M

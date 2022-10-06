local lsp_status = require("lsp-status")

-- See: https://github.com/nvim-lua/lsp-status.nvim#configuration
lsp_status.config({
  diagnostics = false,
})

lsp_status.register_progress()

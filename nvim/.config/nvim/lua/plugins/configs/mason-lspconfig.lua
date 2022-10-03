local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = require("utils").keymap

-- See: https://github.com/williamboman/mason-lspconfig.nvim#configuration
mason_lspconfig.setup({
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  ensure_installed = {
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "marksman",
    "rust_analyzer",
    "sumneko_lua",
    "taplo",
    "tsserver",
    "volar",
    "yamlls",
  },
})

keymap("n", "<space>e", vim.diagnostic.open_float)

-- See: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(_, buffer)
  vim.api.nvim_buf_set_option(buffer, "formatexpr", "v:lua.vim.lsp.formatexpr")
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(buffer, "tagfunc", "v:lua.vim.lsp.tagfunc")

  local opts = { buffer = buffer }

  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gs", vim.lsp.buf.signature_help, opts)
  keymap("n", "gt", vim.lsp.buf.type_definition, opts)
  keymap("n", "cr", vim.lsp.buf.rename, opts)
end

-- See: https://github.com/hrsh7th/cmp-nvim-lsp#setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

mason_lspconfig.setup_handlers({
  function(lsp)
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
  ["volar"] = function()
    lspconfig.volar.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "json",
      },
    })
  end,
})

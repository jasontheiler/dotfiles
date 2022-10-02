local is_installed, mason_lspconfig = pcall(require, "mason-lspconfig")

if not is_installed then
  return
end

-- See: https://github.com/williamboman/mason-lspconfig.nvim#configuration
mason_lspconfig.setup({
  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  ensure_installed = {
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "rust_analyzer",
    "sumneko_lua",
    "taplo",
    "tsserver",
    "volar",
    "yamlls",
  },
})

local is_installed, lspconfig = pcall(require, "lspconfig")

if not is_installed then
  return
end

-- See: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(_, buffer)
  local opts = { buffer = buffer }
end

mason_lspconfig.setup_handlers({
  function(lsp)
    lspconfig[lsp].setup({
      on_attach = on_attach,
    })
  end,

  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      on_attach = on_attach,
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

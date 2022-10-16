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
    -- "jsonls",
    "marksman",
    "rust_analyzer",
    "sumneko_lua",
    "taplo",
    -- "tsserver",
    "volar",
    "yamlls",
  },
})

-- See: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(_, buffer)
  local opts = { buffer = buffer }

  keymap("n", { "K", "<Leader>h" }, vim.lsp.buf.hover, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gs", vim.lsp.buf.signature_help, opts)
  keymap("n", "gt", vim.lsp.buf.type_definition, opts)
  keymap("n", "cr", vim.lsp.buf.rename, opts)
  keymap({ "n", "v" }, "<Leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
end

-- See: https://github.com/hrsh7th/cmp-nvim-lsp#setup
local capabilities = cmp_nvim_lsp.default_capabilities()

local default_setup_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

mason_lspconfig.setup_handlers({
  function(lsp) lspconfig[lsp].setup(default_setup_config) end,

  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup(vim.tbl_extend("force", default_setup_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }))
  end,

  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
  ["volar"] = function()
    lspconfig.volar.setup(vim.tbl_extend("force", default_setup_config, {
      filetypes = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "json",
      },
    }))
  end,
})

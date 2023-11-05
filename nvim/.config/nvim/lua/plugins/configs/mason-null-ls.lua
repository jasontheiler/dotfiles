local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")

-- See: https://github.com/jayp0521/mason-null-ls.nvim#configuration
mason_null_ls.setup({
  ensure_installed = {
    "prettier",
  },
  -- See: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md#configuration
  handlers = {
    ["prettier"] = function()
      null_ls.register(null_ls.builtins.formatting.prettier)
    end,
  },
})

-- See: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.fish_indent.with({
      condition = function()
        return vim.fn.executable("fish_indent") == 1
      end,
    }),
  },
})

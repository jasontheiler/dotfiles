local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local utils = require("utils")

-- See: https://github.com/jayp0521/mason-null-ls.nvim#configuration
mason_null_ls.setup({
    ensure_installed = {
        "prettier",
    },
})

-- See: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md#configuration
mason_null_ls.setup_handlers({
    ["prettier"] = function()
      null_ls.register(null_ls.builtins.formatting.prettier)
    end,
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
    on_attach = function(_, buffer)
      local opts = { buffer = buffer }

      utils.keymap({ "n", "v" }, "<Leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})

--- See: https://github.com/stevearc/conform.nvim
---
--- @type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    local conform = require("conform")

    -- See: https://github.com/stevearc/conform.nvim#options
    conform.setup({
      default_format_opts = {
        async = true,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        css = { "prettier" },
        fish = { "fish_indent" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
        rust = { "dioxus", "rustfmt" },
        scss = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier" },
      },
    })

    vim.keymap.set("n", "<Leader>f", conform.format, { desc = "Format" })
  end,
}

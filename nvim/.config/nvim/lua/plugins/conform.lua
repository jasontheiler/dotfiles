local utils = require("utils")

-- See: https://github.com/stevearc/conform.nvim
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
        json = { "prettier" },
        scss = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier" },
      },
    })

    utils.keymap("n", "<leader>f", conform.format, "Format")
  end,
}

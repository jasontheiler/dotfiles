local noice = require("noice")

-- TODO:
--   - Configue `nvim-notify` (borders, format, colors, etc.)
--   - Remove built-in hover and signature help configs in `opts.lua`.

-- See: https://github.com/folke/noice.nvim
noice.setup({
  cmdline = {
    format = {
      cmdline = { title = " Command ", icon = "❯" },
      filter = { icon = "!", icon_hl_group = "NoiceCmdlineIconFilter" },
      help = false,
      lua = false,
      search_down = { icon = "/" },
      search_up = { icon = "?" },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  views = {
    notify = {
    },
    cmdline_popup = {
      border = { style = "single" }
    },
    hover = {
      border = { style = "single" }
    },
  },
})

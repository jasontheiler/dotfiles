local noice = require("noice")
local utils = require("utils")

-- See: https://github.com/folke/noice.nvim
noice.setup({
  presets = {
    lsp_doc_border = true,
  },
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
      ["cmp.entry.get_documentation"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
})

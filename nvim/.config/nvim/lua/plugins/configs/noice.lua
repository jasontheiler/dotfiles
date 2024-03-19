local noice = require("noice")
local utils = require("utils")

-- See: https://github.com/folke/noice.nvim
noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    lsp_doc_border = true,
  },
  cmdline = {
    format = {
      cmdline = { title = " Command ", icon = "❯", icon_hl_group = "NoiceCmdlineIconCmdline" },
      filter = { icon = "!", icon_hl_group = "NoiceCmdlineIconFilter" },
      help = false,
      lua = false,
      search_down = { icon = "/", icon_hl_group = "NoiceCmdlineIconSearch" },
      search_up = { icon = "?", icon_hl_group = "NoiceCmdlineIconSearch" },
    },
  },
})

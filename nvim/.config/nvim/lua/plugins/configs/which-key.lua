local which_key = require("which-key")

-- See: https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
which_key.setup({
  window = {
    padding = { 1, 0, 2, 0 },
    border = "single",
  },
  icons = { group = "" },
})

-- See: https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
which_key.register({
  ["<leader>b"] = { name = "Buffer" },
  ["<leader>g"] = { name = "Git" },
  ["<leader>l"] = { name = "LSP" },
  ["<leader>r"] = { name = "Random" },
  ["<leader>s"] = { name = "Search" },
  ["<leader>w"] = { name = "Window" },
})

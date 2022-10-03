local is_installed, cmp = pcall(require, "cmp")

if not is_installed then
  return
end

-- See: https://github.com/hrsh7th/nvim-cmp#setup
cmp.setup({
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "nvim_lsp" },
  },
})

vim.opt.completeopt = "menu,menuone,noselect"

local is_installed, mason = pcall(require, "mason")

if not is_installed then
  return
end

-- See: https://github.com/williamboman/mason.nvim#configuration
mason.setup({})

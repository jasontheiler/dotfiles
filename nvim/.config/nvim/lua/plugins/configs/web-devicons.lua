local is_installed, web_devicons = pcall(require, "nvim-web-devicons")

if not is_installed then
  return
end

-- See: https://github.com/kyazdani42/nvim-web-devicons#usage
web_devicons.setup({})

local is_installed, nvim_web_devicons = pcall(require, "nvim-web-devicons")

if not is_installed then
  return
end

-- See: https://github.com/kyazdani42/nvim-web-devicons#usage
nvim_web_devicons.setup({})

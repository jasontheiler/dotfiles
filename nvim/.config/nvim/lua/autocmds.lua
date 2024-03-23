local augroup_default = vim.api.nvim_create_augroup("user_default", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave", "ModeChanged" }, {
  group = augroup_default,
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local mode_hl_suffixes = {
      ["v"] = "Visual",
      ["V"] = "Visual",
      ["Vs"] = "Visual",
      ["\22"] = "Visual",
      ["\22s"] = "Visual",
      ["s"] = "Visual",
      ["S"] = "Visual",
      ["\19"] = "Visual",
      ["i"] = "Insert",
      ["ic"] = "Insert",
      ["ix"] = "Insert",
      ["r"] = "Replace",
      ["R"] = "Replace",
      ["Rc"] = "Replace",
      ["Rx"] = "Replace",
      ["Rv"] = "Replace",
      ["Rvc"] = "Replace",
      ["Rvx"] = "Replace",
    }
    local hl_exists, hl = pcall(
      vim.api.nvim_get_hl_by_name,
      "CursorLineNr" .. (mode_hl_suffixes[mode] or "Normal"),
      true
    )
    if hl_exists then
      vim.api.nvim_set_hl(0, "CursorLineNr", hl)
    end
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup_default,
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 500 })
  end,
})
